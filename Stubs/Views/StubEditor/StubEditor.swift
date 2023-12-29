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
    @StateObject var viewModel = StubEditor.ViewModel()
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var concertNotes = "" // Local note

    
    // Returns true if any field is empty
    var saveReady: Bool {
        !viewModel.concert.artist.isEmpty
        && !viewModel.concert.venue.isEmpty
        && !viewModel.concert.city.isEmpty
    }

    var body: some View {
        NavigationStack{
            Form {
                StubEditorStubPreview(concert: viewModel.concert)
                
                StubDetailsForm(concert: $viewModel.concert)
                
                IconSelector(iconName: $viewModel.concert.iconName)
                
                ColorSelector(accentColor: $viewModel.concert.accentColor)
                
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
        
        
        .onChange(of: viewModel.concert.venue) {
            if !viewModel.concert.city.isEmpty{
                viewModel.getCoordinates()
            }
        }
        
        .onChange(of: viewModel.concert.city) {
            if !viewModel.concert.venue.isEmpty {
                viewModel.getCoordinates()
            }
        }
    }
    
    // Add a new concert from the View's current State
    private func addConcert() {
        
        // Create concert object to insert from data in the View.
        let newConcert = viewModel.concert
        
        modelContext.insert(newConcert)
        
    }

}

extension StubEditor {
    
    class ViewModel: ObservableObject {
        
        // create a template Concert object
        @Published var concert = Concert(
            artist: "",
            venue: "",
            city: "",
            date: Date.now,
            iconName: StubStyle.icons.randomElement()!,
            accentColor: StubStyle.colors.randomElement()!,
            notes: "",
            venueLatitude: 0.0,
            venueLongitude: 0.0
        )
                
        let venueCoordinateService = ConcertVenueLocationService()
        
        func getCoordinates() {
            venueCoordinateService.getCoordinates(for: concert)
            concert.venueLatitude = venueCoordinateService.latitude
            concert.venueLongitude = venueCoordinateService.longitude
        }
    }
}

#Preview {
    StubEditor()
        .modelContainer(for: Concert.self, inMemory: true)
}


