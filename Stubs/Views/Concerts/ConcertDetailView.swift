//
//  StubView.swift
//  Stubs
//
//  Created by christian on 6/9/23.
//

import SwiftUI
import Combine

// MARK: ConcertDetailView
// A View for displaying the ticket stub and relevant data
struct ConcertDetailView: View {
    
    @State var concert: Concert
    @State private var iconTapped = false // For icon animation
    @State private var showingMap = false
    
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        
        VStack(spacing: 0){
            
            StubView(concert: concert, isAddingConcert: false)
            
            actionButtons
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Notes")
                        .font(.title2.bold())
                    Spacer()
                }
                if let notes = concert.notes {
                    Text(notes)
                        .padding(.bottom)
                } else {
                    Text("Add Notes in Ticket Editor.")
                        .foregroundStyle(.tertiary)
                        .padding(.bottom)
                }
                
            }
            .padding(.vertical)
            

            AlbumsByArtist(concert: concert)

        }
        
        .navigationTitle("Stub")
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
    private var actionButtons: some View {
        HStack {
            // View on Map
            ActionButton(titleKey: "Map",
                         defaultImageName: "mappin.and.ellipse",
                         accentColor: .green,
                         concert: $concert) {
                showingMap = true
            }
            
            // Toggle Favorite Status
            ActionButton(titleKey: "Favorite",
                         defaultImageName: "checkmark.seal",
                         highlightedImageName: "checkmark.seal.fill",
                         accentColor: .yellow,
                         concert: $concert) {
                concert.isFavorite.toggle()
            }
            
            // Delete Concert
            ActionButton(titleKey: "Delete",
                         defaultImageName: "trash",
                         accentColor: .red,
                         concert: $concert) {
                modelContext.delete(concert)
            }
        }
    }
}
