//
//  StubView.swift
//  Stubs
//
//  Created by christian on 6/9/23.
//

import Combine
import SwiftData
import SwiftUI

// MARK: ConcertDetailView
// A View for displaying the ticket stub and relevant data
struct ConcertDetailView: View {
    
    @Query var concerts: [Concert]
    @Environment(\.modelContext) var modelContext
    
    @State var concert: Concert
    
    @State private var showingMap = false
    @State private var showingDeleteAlert = false
    @State private var isEditingNotes = false
    
    private var concertsByArtist: [Concert] {
        return concerts.filter({ $0.artist == concert.artist })
    }
    
    var body: some View {
        
        VStack(spacing: 0){
            
            StubView(concert: concert, isAddingConcert: false)
            
            if !isEditingNotes {
                concertButtonRow
                    .transition(.scale(scale: 0.0))
                    //.transition(.push(from: .top))
                
            }
            
            ScrollView {
                
                ConcertNotesTextEditor(concert: $concert, isEditing: $isEditingNotes)
                
                StubThumbnailScrollView(selectedConcert: $concert, concerts: concertsByArtist)
                
                AlbumsByArtist(concert: concert)
                
            }
        }
        
        .navigationTitle("\(concert.artist) | \(concert.venue)" )
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
                    modelContext.delete(concert)
                },
                secondaryButton: .cancel()
            )
        }
    }
}

extension ConcertDetailView {
    
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
        .padding(.vertical, -10)
        .offset(y: -7)
    }
    
    
}
