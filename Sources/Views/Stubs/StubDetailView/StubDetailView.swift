//
//  StubView.swift
//  Stubs
//
//  Created by christian on 6/9/23.
//

import Combine
import SwiftData
import SwiftUI
import TipKit

// MARK: StubDetailView
// A View for displaying the ticket stub and relevant data
struct StubDetailView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.horizontalSizeClass) var sizeClass
    @Query var concerts: [Concert]
    
    @State var concert: Concert
    
    @State private var showingMap = false
    @State private var showingDeleteAlert = false
    @State private var isEditingNotes = false
    
    let favoriteConcertTip = FavoriteConcertTip()
    
    private var concertsByArtist: [Concert] {
        return concerts.filter({ $0.artistName == concert.artistName })
    }
    private var spacing: CGFloat {
        if sizeClass == .compact {
            return 20
        } else {
            return 0
        }
    }
    
    var body: some View {
        
        
        VStack{
            NewStubView(concert: concert)
                .onChange(of: concert) { _, _ in
                    isEditingNotes = false
                }
            
            ScrollView {
                VStack(spacing: spacing){
                    if !isEditingNotes {
                        concertButtonRow
                            .transition(.scale)
                    }
                    
                    StubNotesView(concert: $concert, isEditing: $isEditingNotes)
                    
                    RelatedStubScrollView(selectedConcert: $concert, concerts: concertsByArtist)
                }
            }
        }
        
        
        .navigationTitle("\(concert.artistName) | \(concert.venueName)" )
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
            ActionButton(
                titleKey: "Map",
                systemImage: "mappin.and.ellipse",
                accentColor: .green,
                concert: $concert
            ) {
                showingMap = true
            }
            
            // Toggle Favorite Status
            ActionButton(
                titleKey: "Favorite",
                systemImage: concert.isFavorite ? "checkmark.seal.fill" : "checkmark.seal",
                accentColor: .yellow,
                concert: $concert
            ) {
                concert.isFavorite.toggle()
            }
            .popoverTip(favoriteConcertTip)
            .onTapGesture {
                favoriteConcertTip.invalidate(reason: .actionPerformed)
            }
            
            // Delete Concert
            ActionButton(
                titleKey: "Delete",
                systemImage: "trash",
                accentColor: .red,
                concert: $concert
            ) {
                showingDeleteAlert = true
            }
        }
        .frame(minHeight: 70)
        .padding(.horizontal, 5)
        .frame(maxWidth: 420)
    }
}
