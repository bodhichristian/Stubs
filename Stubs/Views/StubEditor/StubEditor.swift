//
//  AddConcertView.swift
//  Stubs
//
//  Created by christian on 6/8/23.
//

import SwiftUI
import SwiftData

// MARK: StubEditor
// A View that provides a form to add a new concert

struct StubEditor: View {
    
    // Create an instance of concert with default icon and accent color
    @State private var concert = Concert(
        artist: "",
        venue: "",
        city: "",
        date: Date.now,
        iconName: "waveform", // Provide an SF symbol
        accentColor: "cyan", // Provide a value that coincides with a Color type
        notes: " ")
    
    @State private var concertNotes = "" // Local note
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    
    // Returns true if any field is empty
    var formIncomplete: Bool {
        concert.artist.isEmpty
        || concert.venue.isEmpty
        || concert.city.isEmpty
    }
    
    var body: some View {
        NavigationStack{
            Form {
                StubEditorPreview(concert: concert)
                
                StubDetailsForm(concert: $concert)
                
                IconSelector(iconName: $concert.iconName, accentColor: $concert.accentColor)
                
                ColorSelector(accentColor: $concert.accentColor)
                
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
                    .disabled(formIncomplete)
                }
            }
        }
    }
    
    // Add a new concert from the View's current State
    private func addConcert() {
        // Create concert object to insert from data in the View.
        let newConcert = Concert(artist: concert.artist, venue: concert.venue, city: concert.city, date: concert.date, iconName: concert.iconName, accentColor: concert.accentColor, notes: concertNotes)
        
        modelContext.insert(newConcert)
        
    }
}

extension StubEditor {
    // Section for user input of concert details
    private var addConcertDetails: some View {
        Section("Details") {
            HStack {
                TextField("Artist", text: $concert.artist)
                
                Image(systemName: concert.artist.isEmpty ? "play.circle": "play.circle.fill")
                    .foregroundStyle(concert.artist.isEmpty
                                     ? .gray
                                     : .green)
            }
            TextField("Venue", text: $concert.venue)
            TextField("City", text: $concert.city)
            DatePicker("Date", selection: $concert.date, displayedComponents: .date)
        }
    }
    
}

#Preview {
    StubEditor()
        .modelContainer(for: Concert.self, inMemory: true)
}

