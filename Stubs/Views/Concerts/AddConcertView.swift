//
//  AddConcertView.swift
//  Stubs
//
//  Created by christian on 6/8/23.
//

import SwiftUI
import SwiftData

// MARK: AddConcertView - SwiftUI View
// A View that provides a form to add a new concert

struct AddConcertView: View {
    // MARK: concert
    // Create an instance of concert with default icon and accent color
    @State private var concert = Concert(artist: "", venue: "", city: "", date: Date.now, iconName: "guitars", accentColor: "blue")
    
    @State private var colorOptions = Customizable.colors
    @State private var iconOptions = Customizable.icons
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    
    var formIncomplete: Bool { // Returns true if any field is empty
        concert.artist.isEmpty || concert.venue.isEmpty || concert.city.isEmpty
    }
  
    var body: some View {
        NavigationStack{
            Form {
                addConcertDetails
                
                IconSelector(iconName: $concert.iconName, accentColor: $concert.accentColor)
                
                ColorSelector(accentColor: $concert.accentColor)
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
                    .disabled(formIncomplete)
                }
            }
        }
    }
    
    // Add a new concert from the View's current State
    private func addConcert() {
        withAnimation {
            modelContext.insert(concert)
        }
    }
}

extension AddConcertView {
    // Section for user input of concert details
    private var addConcertDetails: some View {
        Section("Details") {
            TextField("Artist", text: $concert.artist)
            TextField("Venue", text: $concert.venue)
            TextField("City", text: $concert.city)
            DatePicker("Date", selection: $concert.date, displayedComponents: .date)
        }
    }
    
}

#Preview {
    AddConcertView()
        .modelContainer(for: Concert.self, inMemory: true)
}


