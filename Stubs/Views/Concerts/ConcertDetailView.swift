//
//  StubView.swift
//  Stubs
//
//  Created by christian on 6/9/23.
//

import SwiftUI

// MARK: ConcertDetailView - SwiftUI View
// A View for displaying the ticket stub and providing interactivity
// Concert actions: Map View, YouTube, Favorite, Delete

struct ConcertDetailView: View {
    @State var concert: Concert
    @State private var iconTapped = false // For icon animation
    @State private var showingMapView = false
    
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        VStack{
            StubView(concert: concert)
            
            actionButtons
        }
        .navigationTitle("Stub")
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal)
        .sheet(isPresented: $showingMapView) {
            VenueMapView(concert: concert)
        }
    }
}

extension ConcertDetailView {
    
    // Horizontal Stack of Buttons
    private var actionButtons: some View {
        HStack {
            // View on Map
            ActionButton(titleKey: "Map",
                         defaultImageName: "mappin.and.ellipse",
                         accentColor: .green,
                         concert: $concert) {
                showingMapView = true
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
