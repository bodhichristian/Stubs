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
            // Display Ticket Stub
            StubView(concert: concert, size: .large)
            // Provide Action Buttons: Map View, YouTube, Favorite, Delete
            actionButtons
        }
        .navigationTitle("Stub")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showingMapView) {
            VenueMapView(concert: concert)
        }
    }
}

extension ConcertDetailView {
    // Map View, YouTube, Favorite, Delete
    private var actionButtons: some View {
        HStack {
            
                ActionButton(titleKey: "Map View",
                             defaultImageName: "mappin.and.ellipse",
                             accentColor: .green,
                             concert: $concert) {
                    showingMapView = true
                }
                
                ActionButton(titleKey: "Favorite",
                             defaultImageName: "checkmark.seal",
                             highlightedImageName: "checkmark.seal.fill",
                             accentColor: .yellow,
                             concert: $concert) {
                    concert.isFavorite.toggle()
                }
            
            
            
                ActionButton(titleKey: "Delete",
                             defaultImageName: "trash",
                             accentColor: .red,
                             concert: $concert) {
                    modelContext.delete(concert)
                }
            
        }
        
    }
}
