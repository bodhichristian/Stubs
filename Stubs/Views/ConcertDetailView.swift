//
//  StubView.swift
//  Stubs
//
//  Created by christian on 6/9/23.
//

import SwiftUI

struct ConcertDetailView: View {
    @State var concert: Concert
    @State private var iconTapped = false // For icon animation
    @State private var showingMapView = false
    @Environment(\.modelContext) var modelContext

    let gradient = LinearGradient( // For stub base
        colors: [.clear, .black.opacity(0.5)],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

        
    var body: some View {
        VStack{
            StubView(concert: concert, size: .large)
            
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
    // Map View, Favorite, Delete
    private var actionButtons: some View {
        HStack {
            VStack {
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
            }
            
            VStack {
                NavigationLink {
                    YouTubeSearchResultsView(concert: concert)
                } label: {
                    
                    Label(title: {
                        Text("YouTube")
                        .foregroundColor(.primary)
                        .frame(width: 120)
                    }, icon: {
                        // If concert is Favorite
                        Image(systemName: "video")
                        .renderingMode(.template)
                        .foregroundColor(.red)
                    } )
                    .padding(5)
                }
                .buttonStyle(.borderedProminent)
                .tint(.secondary.opacity(0.1))
                
                ActionButton(titleKey: "Delete",
                             defaultImageName: "trash",
                             accentColor: .red,
                             concert: $concert) {
                    modelContext.delete(concert)
                }
            }
        }
    }
}
