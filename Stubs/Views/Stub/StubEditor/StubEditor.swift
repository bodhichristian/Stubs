//
//  AddConcertView.swift
//  Stubs
//
//  Created by christian on 6/8/23.
//

import SwiftUI
import SwiftData
import MapKit

// MARK: StubEditor
// A View that provides a form to add a new concert

struct StubEditor: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State private var artist = Artist()

    @State private var newConcert = Concert(
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
    
    var body: some View {
        NavigationStack{
            Form {
                StubEditorStubPreview(concert: newConcert)
                
                StubEditorDetails(concert: $newConcert, artist: $artist)
                
                StubEditorIconSelector(iconName: $newConcert.iconName)
                
                StubEditorColorSelector(accentColor: $newConcert.accentColor)
                
                StubEditorNotes(concertNotes: $newConcert.notes)
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
        !newConcert.artistName.isEmpty
        && !newConcert.venue.isEmpty
        && !newConcert.city.isEmpty
    }
    
    // MARK: - Methods

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
                let coordinates = try await getCoordinates(for: newConcert)
                
                // Update concert details with retrieved coordinates
                newConcert.venueLatitude = coordinates.latitude
                newConcert.venueLongitude = coordinates.longitude
                
                // Insert updated concert details into model context
                modelContext.insert(newConcert)
                if artist.artistName != nil {
                    modelContext.insert(artist)
                }
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


#Preview {
    StubEditor()
        .modelContainer(for: Concert.self, inMemory: true)
}


