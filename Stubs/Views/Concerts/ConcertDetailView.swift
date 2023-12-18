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
    
    @State var concert: Concert
    @State private var iconTapped = false // For icon animation
    @State private var showingMap = false
    
    @Environment(\.modelContext) var modelContext
    
    @Query var concerts: [Concert]
    
    private var concertsByArtist: [Concert] {
        return concerts.filter({ $0.artist == concert.artist })
    }
    
    var body: some View {
        
        VStack(spacing: 0){
            
            StubView(concert: concert, isAddingConcert: false)
            
            concertButtonRow
            
            ScrollView{
                

                VStack(alignment: .leading) {
                    HStack {
                        Text("Notes")
                            .font(.title2.bold())
                            .padding(.bottom, 10)
                        Spacer()
                    }
                    if let notes = concert.notes {
                        Text(notes)
                            .font(.callout)
                            .padding(.bottom)
                    } else {
                        Text("Add Notes in Ticket Editor.")
                            .foregroundStyle(.tertiary)
                            .padding(.bottom)
                    }
                    
                }
                .padding(.top)
                
                Divider()
                    .padding(.bottom)
                
                StubThumbnailScrollView(concerts: concertsByArtist)
                
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
