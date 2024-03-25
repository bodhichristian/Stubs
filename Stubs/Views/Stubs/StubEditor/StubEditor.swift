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
    @State private var concertService = ConcertService()
    
    let addConcertTip: AddConcertTip

    // Returns false if any field is empty
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
                            try? await saveConcert()
                        }
                        addConcertTip.invalidate(reason: .actionPerformed)
                        dismiss()
                    }
                    .disabled(!saveReady)
                }
            }
        }
    }
  
    private func saveConcert() async throws{
        do {
            if let savedArtist = artists.first(where: {
                $0.artistName == concertService.template.artistName
            }) {
                try await concertService.buildConcert(with: savedArtist)
            } else {
                try await concertService.buildConcert()
            }
        } catch {
            throw ConcertServiceError.failedToBuildConcert
        }
        modelContext.insert(concertService.template)
    }
}



