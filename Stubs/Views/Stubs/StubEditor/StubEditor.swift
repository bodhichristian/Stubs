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
    @Query var artists: [Artist]
    
    let addConcertTip: AddConcertTip
    
    @State private var artistService = ArtistService()
    @State private var mapKitService = MapKitService()
    @State private var template = Concert(
        iconName: StubStyle.colors.randomElement()!,
        accentColor: StubStyle.colors.randomElement()!
    )
    // Returns false if any field is empty
    private var saveReady: Bool {
        !template.artistName.isEmpty
        && !template.venue.isEmpty
        && !template.city.isEmpty
    }
    
    var body: some View {
        NavigationStack {
            Form {
                StubEditorStubPreview(concert: template)
                StubEditorDetails(concert: template)
                StubEditorIconSelector(iconName: $template.iconName)
                StubEditorColorSelector(accentColor: $template.accentColor)
                StubEditorNotes(concertNotes: $template.notes)
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
                        if let savedArtist = artists.first(where: {
                            $0.artistName == template.artistName
                        }) {
                            saveConcert(with: savedArtist)
                        } else {
                            saveConcert()
                        }
                        
                        addConcertTip.invalidate(reason: .actionPerformed)
                        dismiss()
                    }
                    .disabled(!saveReady)
                }
            }
        }
    }
    
    private func saveConcert(with artist: Artist? = nil)  {
        Task {
            do {
                // MapKit service
                try await mapKitService.getCoordinates(for: template)
                template.venueLatitude = mapKitService.latitude
                template.venueLongitude = mapKitService.longitude
            }
            
            let newConcert = Concert(
                artistName: template.artistName,
                venue: template.venue,
                city: template.city,
                date: template.date,
                iconName: template.iconName,
                accentColor: template.accentColor,
                notes: template.notes,
                venueLatitude: template.venueLatitude,
                venueLongitude: template.venueLongitude
            )
            
            // Artist service
            if let savedArtist = artist {
                newConcert.artist = savedArtist
            } else {
                try await artistService.search(for: template.artistName)
                newConcert.artist = artistService.fetchedArtist
                
            }
            
            modelContext.insert(newConcert)
        }
    }
}



