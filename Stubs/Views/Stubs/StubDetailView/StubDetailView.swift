//
//  StubView.swift
//  Stubs
//
//  Created by christian on 6/9/23.
//

import Combine
import SwiftData
import SwiftUI

// MARK: StubDetailView
// A View for displaying the ticket stub and relevant data
struct StubDetailView: View {
    
    @Query var concerts: [Concert]
    @Environment(\.modelContext) var modelContext
    
    @State var concert: Concert
    
    @State private var showingMap = false
    @State private var showingDeleteAlert = false
    @State private var isEditingNotes = false
    
    private var concertsByArtist: [Concert] {
        return concerts.filter({ $0.artistName == concert.artistName })
    }
    
    var body: some View {
        
        VStack(spacing: 0){
            
            StubView(concert: concert)
                .onChange(of: concert) { _, _ in
                    isEditingNotes = false
                }
            
            ScrollView {
            if !isEditingNotes {
                concertButtonRow
                    .transition(.scale)
            }
            
                StubNotesView(concert: $concert, isEditing: $isEditingNotes)
                
                RelatedStubScrollView(selectedConcert: $concert, concerts: concertsByArtist)
                
                
                
            }
        }
        
        .navigationTitle("\(concert.artistName) | \(concert.venue)" )
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal)
        
        // Present a Map of the concert venue
        .sheet(isPresented: $showingMap) {
            VenueMapView(concert: concert)
        }
        
        // Present an Alert to confirm deletion
        .alert(isPresented: $showingDeleteAlert) {
            Alert(
                title: Text("Delete Stub"),
                message: Text("Are you sure you want to delete this stub?"),
                primaryButton: .destructive(Text("Delete")) {
                    
                    
                    // TODO: Write logic for checking if this is the only stub for a particular artist. If so, delete the artist from the model context as to prevent unnecessary storage of irrelevant data.
                    
                    
                    modelContext.delete(concert)
                    
                    
                },
                secondaryButton: .cancel()
            )
        }
    }
}

extension StubDetailView {
    
    // MARK: actionButtons
    // Map, Favorite, and Delete selections
    private var concertButtonRow: some View {
        HStack {
            // View on Map
            ActionButton(titleKey: "Map",
                         systemImage: "mappin.and.ellipse",
                         accentColor: .green,
                         concert: $concert) {
                showingMap = true
            }

            // Toggle Favorite Status
            ActionButton(titleKey: "Favorite",
                         systemImage: concert.isFavorite ? "checkmark.seal.fill" : "checkmark.seal",
                         accentColor: .yellow,
                         concert: $concert) {
                concert.isFavorite.toggle()
            }
            
            // Delete Concert
            ActionButton(titleKey: "Delete",
                         systemImage: "trash",
                         accentColor: .red,
                         concert: $concert) {
                showingDeleteAlert = true
            }
        }
        .frame(minHeight: 70)
        .padding(.horizontal, 5)
        .offset(y: -7)
        
    }
    
    
}
