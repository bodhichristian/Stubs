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
    
    @Environment(\.modelContext) var modelContext
    
    @State var concert: Concert
    
    @State private var showingMap = false

    @Query var concerts: [Concert]
    
    private var concertsByArtist: [Concert] {
        return concerts.filter({ $0.artist == concert.artist })
    }
    
    var body: some View {
        
        VStack(spacing: 0){
            
            StubView(concert: concert, isAddingConcert: false)
            
            concertButtonRow
                
            ScrollView {
                
                ConcertNotesTextEditor(concert: $concert)

                Divider()
                    .padding(.bottom)
                
                StubThumbnailScrollView(selectedConcert: $concert, concerts: concertsByArtist)
                
                Divider()
                
                AlbumsByArtist(concert: concert)

                
            }
        }
        
        .navigationTitle("\(concert.artist) | \(concert.venue)" )
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal)
        .sheet(isPresented: $showingMap) {
            
            VenueMapView(concert: concert)
            
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
                modelContext.delete(concert)
            }
        }
    }
}
