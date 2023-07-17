//
//  AddConcertView.swift
//  Stubs
//
//  Created by christian on 6/8/23.
//

import SwiftUI
import SwiftData

struct AddConcertView: View {    
    @State private var artist = ""
    @State private var venue = ""
    @State private var city = ""
    @State private var date = Date()
    @State private var iconName = "guitars" // Provides a default value
    @State private var accentColor = "blue" // Provides a default value
    
    @State private var colorOptions = Customizable.colors
    @State private var iconOptions = Customizable.icons
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    
    var formNotComplete: Bool { // Returns true if any field is empty
        artist.isEmpty || venue.isEmpty || city.isEmpty
    }
  
    var body: some View {
        NavigationStack{
            Form {
                detailInput
                
                IconSelector(iconName: $iconName, accentColor: $accentColor)
                
                ColorSelector(accentColor: $accentColor)
            }
            .navigationTitle("Add Concert")
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
                    .disabled(formNotComplete)
                }
            }
        }
    }
}

#Preview {
    AddConcertView()
        .modelContainer(for: Concert.self, inMemory: true)
}

extension AddConcertView {
    // Section for user input of concert details
    private var detailInput: some View {
        Section("Details") {
            TextField("Artist", text: $artist)
            TextField("Venue", text: $venue)
            TextField("City", text: $city)
            DatePicker("Date", selection: $date, displayedComponents: .date)
        }
    }
    // Add a new concert from the View's current State
    private func addConcert() {
        let newConcert = Concert(artist: artist,
                                 venue: venue,
                                 city: city,
                                 date: date,
                                 iconName: iconName,
                                 accentColor: accentColor)
        withAnimation {
            modelContext.insert(newConcert)
        }
    }
}

