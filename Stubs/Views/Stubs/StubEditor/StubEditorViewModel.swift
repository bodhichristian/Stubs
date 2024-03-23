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
        var addConcertFailed: Bool
        var artistService: ArtistService
        var mapKitService: MapKitService
        var modelContext: ModelContext

        let saveFailedAlert = Alert(
            title: Text("Save Error"),
            message: Text("Unable to save Stub."),
            dismissButton: .default(Text("OK"))
        )
        
        init(modelContext: ModelContext) {
            self.modelContext = modelContext
            self.addConcertFailed = false
            self.artistService = ArtistService()
            self.mapKitService = MapKitService()
        }
        
        // MARK: - ViewModel methods
        
        @MainActor
        public func addConcert(_ concert: Concert) {
            Task {
                do {
                    // Attempt to get coordinates for the new concert
                    try await mapKitService.getCoordinates(for: concert)
                    
                    // Update concert details with retrieved coordinates
                    concert.venueLatitude = mapKitService.latitude
                    concert.venueLongitude = mapKitService.longitude
                    
                    
                    //concert.mapSnapshotData = mapKitService.getMapSnapshot()
                    
                    // Search for artist by name in the `artists` array
                    if let existingArtist = artists.first(where: { $0.artistName == concert.artistName }) {
                        concert.artist = existingArtist
                    } else {
                        // If no artist is found, search TheAudioDB
//                        try await artistService.search(for: concert.artistName)
//
//                        if let artist = artistService.searchResponse.first {
//                            concert.artist = artist
//                        }
                        
                        if let fetchedArtist = try await artistService.search(for: concert.artistName) {
                        
//                            // Fetch artist profile image
//                            fetchImageData(from: fetchedArtist.artistImageURL ?? "") { data in
//                                fetchedArtist.artistImageData = data
//                                
//                            }
//                            
//                            // Fetch artist banner image
//                            fetchImageData(from: fetchedArtist.bannerImageURL ?? "") { data in
//                                fetchedArtist.bannerImageData = data
//                            }
                            
                            concert.artist = fetchedArtist
                        }
                        
                        
                    }
                    

                    // Tally TipKit Event
                    await ArtistsViewOptionsTip.addArtistEvent.donate()
                    
                    modelContext.insert(concert)
                    try modelContext.save()
                    
                    
                } catch {
                    // Handle error
                    print(error.localizedDescription)
                    
                    
                    addConcertFailed = true
                }
            }
        }
        

        
        
        
  
    }
}




