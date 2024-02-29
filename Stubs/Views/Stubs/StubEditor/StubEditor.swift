//
//  AddConcertView.swift
//  Stubs
//
//  Created by christian on 6/8/23.
//

import MapKit
import SwiftUI
import SwiftData

struct StubEditor: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    // MARK: Local concert for editing
    @State private var concertTemplate = Concert(
        artistName: "",
        venue: "",
        city: "",
        date: Date.now,
        iconName: StubStyle.icons.randomElement()!,
        accentColor: StubStyle.colors.randomElement()!,
        notes: "",
        venueLatitude: 0.0,
        venueLongitude: 0.0
    )
    
    
    @State private var addConcertFailed = false
    @State private var addConcertFailedAlert: Alert?
    @State private var artistService = ArtistService()
    @State private var debounceTimer: Timer?
    @State private var fetchedArtist: Artist?
    
    var body: some View {
        NavigationStack {
                Form {
                    StubEditorStubPreview(concert: concertTemplate)
                    //StubView(concert: concertTemplate)
                    StubEditorDetails(concert: concertTemplate)
                    
                    StubEditorIconSelector(iconName: $concertTemplate.iconName)
                    
                    StubEditorColorSelector(accentColor: $concertTemplate.accentColor)
                    
                    StubEditorNotes(concertNotes: $concertTemplate.notes)
            }
            .navigationTitle("Stub Editor")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        addConcert()
                    }
                    .disabled(!saveReady)
                }
            }
            
            .onChange(of: concertTemplate.artistName) {
                // Invalidate existing timer
                debounceTimer?.invalidate()
                
                
                // Start a new timer
                debounceTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false, block: { _ in
                    print("StubEditor: concert.artistName has changed")
                    print("StubEditor: now searching for \(concertTemplate.artistName)")
                    artistService.search(for: concertTemplate.artistName)
                })
            }
            
            
            .onChange(of: artistService.searchResponse) { _, response in
                if let artist = response.first {
                    print("StubEditor: artist search response received.")
                    
                    fetchedArtist = artist
                    print("StubEditor: artist binding value has been updated.")
                    
                    fetchImageData(from: artist.artistImageURL ?? "") { data in
                        fetchedArtist?.artistImageData = data
                        print("StubEditor: imageData fetched")
                        print("StubEditor: Data: \(String(describing: data))")
                    }
                    
                    fetchImageData(from: artist.bannerImageURL ?? "") { data in
                        fetchedArtist?.bannerImageData = data
                    }
                    
                } else {
                    print("StubEditorDetails: artist search failed.")
                }
            }            
        }
        .alert(isPresented: $addConcertFailed) {
            addConcertFailedAlert ?? Alert(title: Text("Error"))
        }
    }
}




extension StubEditor {
    
    // MARK: - Computed Properties
    
    // Returns true if any field is empty
    private var saveReady: Bool {
        !concertTemplate.artistName.isEmpty
        && !concertTemplate.venue.isEmpty
        && !concertTemplate.city.isEmpty
    }
    
    // MARK: - Methods
    
    // MARK: fetchImageData(from urlString:)
    private func fetchImageData(from urlString: String, completion: @escaping (Data?) -> Void) {
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
    
    
    // MARK: addConcert()
    /**
     Adds a concert after retrieving and storing its coordinates.
     
     Retrieves coordinates asynchronously for a new concert and updates concert details.
     Handles errors by printing them to the console.
     Inserts updated concert details into the model context.
     
     No parameters or return value.
     Uses `Task` for concurrency and error handling within async context.
     */
    private func addConcert() {
        
        // Start asynchronous task to fetch coordinates
        Task {
            do {
                // Attempt to get coordinates for the new concert
                let coordinates = try await getCoordinates(for: concertTemplate)
                
                // Update concert details with retrieved coordinates
                concertTemplate.venueLatitude = coordinates.latitude
                concertTemplate.venueLongitude = coordinates.longitude
                
                // Create a new Concert object.
                // Use fetchedArtist object if available.
                let newConcert = Concert(
                    artistName: concertTemplate.artistName,
                    venue: concertTemplate.venue,
                    city: concertTemplate.city,
                    date: concertTemplate.date,
                    iconName: concertTemplate.iconName,
                    accentColor: concertTemplate.accentColor,
                    notes: concertTemplate.notes,
                    venueLatitude: concertTemplate.venueLatitude,
                    venueLongitude: concertTemplate.venueLongitude
                )
                
                // Insert updated concert details into model context
                modelContext.insert(newConcert)
                
                dismiss()
                
            } catch let error {
                // Print error if unable to get coordinates
                print(error.localizedDescription)
                
                // Create an alert object
                addConcertFailedAlert = Alert(
                    title: Text("Save Error"),
                    message: Text(error.localizedDescription),
                    dismissButton: .default(Text("OK"))
                )
                
                // Trigger alert
                addConcertFailed = true
                
            }
        }
    }
    
    // MARK: - getCoordinates(for:)
    /**
     Retrieves coordinates for given concert details.
     
     - Parameters:
     - concert: `Concert`
     - Returns: Tuple containing latitude and longitude of the concert venue.
     
     Uses MKLocalSearch to query based on concert venue and city. Converts query response to geographic coordinates.
     Throws error if unable to find location or extract coordinates from response.
     */
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
