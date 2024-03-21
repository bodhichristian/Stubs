//
//  StubView-ViewModel.swift
//  Stubs
//
//  Created by christian on 3/21/24.
//

import Foundation
import MapKit
import SwiftData
import SwiftUI


extension StubEditor {
    
    @Observable
    class ViewModel {
        var artists = [Artist]()
        var concerts = [Concert]()
        var modelContext: ModelContext
        var addConcertFailed: Bool
        var artistService: ArtistService
        
        let saveFailedAlert = Alert(
            title: Text("Save Error"),
            message: Text("Unable to save Stub."),
            dismissButton: .default(Text("OK"))
        )
        
        init(modelContext: ModelContext) {
            self.modelContext = modelContext
            self.addConcertFailed = false
            self.artistService = ArtistService()
            fetchData()
        }
        
        // MARK: - ViewModel methods
        
        @MainActor
        public func addConcert(_ concert: Concert) {
            Task {
                do {
                    // Attempt to get coordinates for the new concert
                    let coordinates = try await getCoordinates(for: concert)
                    
                    // Update concert details with retrieved coordinates
                    concert.venueLatitude = coordinates.latitude
                    concert.venueLongitude = coordinates.longitude
                    
                    // Search for artist by name in the `artists` array
                    if let existingArtist = artists.first(where: { $0.artistName == concert.artistName }) {
                        concert.artist = existingArtist
                    } else {
                        // If no artist is found, search TheAudioDB
                        try await artistService.search(for: concert.artistName)

                        if let artist = artistService.searchResponse.first {
                            concert.artist = artist
                        }
                        
                        // Fetch Artist profile and banner images
                        fetchImageData(from: concert.artist?.artistImageURL ?? "") { data in
                            concert.artist?.artistImageData = data
                        }

                        fetchImageData(from: concert.artist?.bannerImageURL ?? "") { data in
                            concert.artist?.bannerImageData = data
                        }
                    }
                    
                    
                    modelContext.insert(concert)
                    try modelContext.save()
                    // Tally TipKit Event
                    await ArtistsViewOptionsTip.addArtistEvent.donate()
                    
                } catch {
                    // Handle error
                    print(error.localizedDescription)
                    
                    
                    addConcertFailed = true
                }
            }
            fetchData()
        }
        
        func fetchData() {
            do {
                let artistDescriptor = FetchDescriptor<Artist>(
                    sortBy: [SortDescriptor(\.artistName)]
                )
                let concertDescriptor = FetchDescriptor<Concert>(
                    sortBy: [SortDescriptor(\.artistName)]
                )
                concerts = try modelContext.fetch(concertDescriptor)
                artists = try modelContext.fetch(artistDescriptor)
            } catch {
                print("Fetch failed")
            }
        }

        private func fetchImageData(
            from urlString: String,
            completion: @escaping (Data?) -> Void
        ) {
            guard let url = URL(string: urlString) else {
                completion(nil)
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else {
                    completion(nil)
                    return
                }
                completion(data)
            }
            task.resume()
        }
        
        private func getCoordinates(
            for concert: Concert
        ) async throws -> (latitude: Double, longitude: Double) {
            
            // Construct search request using concert details
            let request = MKLocalSearch.Request()
            let query = concert.venue + " venue " + concert.city
            
            request.naturalLanguageQuery = query
            request.resultTypes = .pointOfInterest
            
            // Debug print for query search
            print("searching for \(query)")
            
            // Initialize and start search
            let search = MKLocalSearch(request: request)
            let response = try? await search.start()
            
            // Ensure coordinates are available, else throw error
            guard let coordinates = response?.mapItems.first?.placemark.coordinate else  {
                throw NSError(domain: "LocationError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Unable to find location"])
            }
            
            // Return latitude and longitude as tuple
            return (
                latitude: coordinates.latitude,
                longitude: coordinates.longitude
            )
        }
  
    }
}




