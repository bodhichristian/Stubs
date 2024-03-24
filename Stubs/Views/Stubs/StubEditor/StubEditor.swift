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
    @State private var concertService = ConcertService()
    @State private var mapKitService = MapKitService()
    
    
    // Returns true if any field is empty
    private var saveReady: Bool {
        !concertService.template.artistName.isEmpty
        && !concertService.template.venue.isEmpty
        && !concertService.template.city.isEmpty
    }
    
    var body: some View {
        NavigationStack {
            Form {
                StubEditorStubPreview(concert: concertService.template)
                StubEditorDetails(concert: concertService.template)
                StubEditorIconSelector(iconName: $concertService.template.iconName)
                StubEditorColorSelector(accentColor: $concertService.template.accentColor)
                StubEditorNotes(concertNotes: $concertService.template.notes)
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
                        Task {
                        
                            if let savedArtist = artists.first(where: {$0.artistName == concertService.template.artistName}) {
                                saveConcert(with: savedArtist)
                            } else {
                                saveConcert()
                            }
                        }
                        
                        addConcertTip.invalidate(reason: .actionPerformed)
                        dismiss()
                    }
                    .disabled(!saveReady)
                }
            }
//                        .alert(isPresented: $concertService.artistService.fetchFailed) {
//                            Alert(title: Text("Save Failed"))
//                        }
        }
    }
    
    private func saveConcert(with artist: Artist? = nil)  {
        Task {
            do {
                
                if let savedArtist = artist {
                    concertService.template.artist = savedArtist
                } else {
                    try await artistService.search(for: concertService.template.artistName)
                    concertService.template.artist = artistService.fetchedArtist
                    
                }
                
                try await mapKitService.getCoordinates(for: concertService.template)
                concertService.template.venueLatitude = mapKitService.latitude
                concertService.template.venueLongitude = mapKitService.longitude
                
            }
            
            let newConcert = Concert(
                artistName: concertService.template.artistName,
                venue: concertService.template.venue,
                city: concertService.template.city,
                date: concertService.template.date,
                iconName: concertService.template.iconName,
                accentColor: concertService.template.accentColor,
                notes: concertService.template.notes,
                venueLatitude: concertService.template.venueLatitude,
                venueLongitude: concertService.template.venueLongitude
            )
            
            newConcert.artist = artistService.fetchedArtist
            modelContext.insert(newConcert)
        }
    }
}



