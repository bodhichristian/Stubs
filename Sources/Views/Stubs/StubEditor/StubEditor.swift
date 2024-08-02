//
//  AddConcertView.swift
//  Stubs
//
//  Created by christian on 6/8/23.
//

import SwiftUI
import SwiftData

struct StubEditor: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext

    @State private var concertService = ConcertService()
    @State private var isSaving = false
    
    let addConcertTip: AddConcertTip
    
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
                    Button {
                        isSaving = true
                    } label: {
                        if isSaving {
                            ProgressView()
                                .task {
                                    try? await saveConcert()
                                }
                        } else {
                            Text("Save")
                        }
                    }
                    .disabled(!saveReady || isSaving)
                    .animation(.default, value: isSaving)
                }
            }
        }
    }
    
    private func saveConcert() async throws {
        do {
            let descriptor = FetchDescriptor<Artist>(predicate: #Predicate { $0.artistName == concertService.template.artistName })
            let existingArtists = try modelContext.fetch(descriptor)
            
            if let existingArtist = existingArtists.first {
                try await concertService.buildConcert(with: existingArtist)
            } else {
                try await concertService.buildConcert()
            }
            
            modelContext.insert(concertService.template)
            try? modelContext.save()
            isSaving = false
            
            addConcertTip.invalidate(reason: .actionPerformed)
            dismiss()
        } catch {
            throw SaveError.failedToSaveConcert
        }
    }
}



