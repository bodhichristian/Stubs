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
    @State private var viewModel: ViewModel
    
    // MARK: Local concert for editing
    @State private var concertTemplate = Concert(
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

    
    let addConcertTip: AddConcertTip
    let artistViewOptionsTip = ArtistsViewOptionsTip()
    
    // Returns true if any field is empty
    private var saveReady: Bool {
        !concertTemplate.artistName.isEmpty
        && !concertTemplate.venue.isEmpty
        && !concertTemplate.city.isEmpty
    }
    
    var body: some View {
        NavigationStack {
            Form {
                StubEditorStubPreview(concert: concertTemplate)
                StubEditorDetails(concert: concertTemplate)
                StubEditorIconSelector(iconName: $concertTemplate.iconName)
                StubEditorColorSelector(accentColor: $concertTemplate.accentColor)
                StubEditorNotes(concertNotes: $concertTemplate.notes)
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
                        viewModel.addConcert(concertTemplate)
                        
                        if !viewModel.addConcertFailed {
                            addConcertTip.invalidate(reason: .actionPerformed)
                            dismiss()
                        }
                    }
                    .disabled(!saveReady)
                }
            }
            .alert(isPresented: $viewModel.addConcertFailed) {
                viewModel.alert
            }
        }
        
    }
    
    init(modelContext: ModelContext, addConcertTip: AddConcertTip) {
        let viewModel = ViewModel(modelContext: modelContext)
        _viewModel = State(initialValue: viewModel)
        self.addConcertTip = addConcertTip
    }
}



