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
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss

    @State private var newConcert = Concert.template
    @State private var concertNotes = "" // Local note
    
    @State private var isShowingAlert = false
    private let alertTitle = "Unable to save."
    private let alertMessage = "There was an error saving your concert. Please try again."
    
    var body: some View {
        NavigationStack{
            Form {
                StubEditorStubPreview(concert: newConcert)
                
                StubDetailsForm(concert: $newConcert)
                
                IconSelector(iconName: $newConcert.iconName)
                
                ColorSelector(accentColor: $newConcert.accentColor)
                
                Section("Notes"){
                    TextEditor(text: $concertNotes)
                        .frame(minHeight: 100)
                }
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
                        dismiss()
                    }
                    .disabled(!saveReady)
                }
            }
        }

    }
}

extension StubEditor {

    
    // Returns true if any field is empty
    var saveReady: Bool {
        !newConcert.artist.isEmpty
        && !newConcert.venue.isEmpty
        && !newConcert.city.isEmpty
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
                let coordinates = try await getCoordinates(for: newConcert)
                
                // Update concert details with retrieved coordinates
                newConcert.venueLatitude = coordinates.latitude
                newConcert.venueLongitude = coordinates.longitude
            } catch let error {
                // Print error if unable to get coordinates
                print(error.localizedDescription)
            }
        }
        
        // Insert updated concert details into model context
        modelContext.insert(newConcert)
        
    }
    
    // MARK: getCoordinates(for:)
    /**
     Retrieves coordinates for given concert details.

     - Parameters:
         - concert: `Concert` object containing details like venue and city.
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


