//
//  StubView.swift
//  Stubs
//
//  Created by christian on 6/9/23.
//

import SwiftUI
import Combine

// MARK: ConcertDetailView - SwiftUI View
// A View for displaying the ticket stub and providing interactivity
// Concert actions: Map View, YouTube, Favorite, Delete

struct ConcertDetailView: View {
   // @StateObject var viewModel = ConcertDetailView.ViewModel()
    
    @State var concert: Concert
    @State private var iconTapped = false // For icon animation
    @State private var showingMap = false
    
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        VStack(spacing: 0){
            
            StubView(concert: concert, isAddingConcert: false)
            
            actionButtons

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
    
    class ViewModel: ObservableObject {
        private let albumService = AlbumSearchService()
        private var cancellables = Set<AnyCancellable>()
        
        @Published var albums: [Album] = []
        
        func searchAlbums(for artist: String) {
            albumService.$albums
                .receive(on: DispatchQueue.main)
                .sink { [weak self] in self?.albums = $0 }
                .store(in: &cancellables)
            
            albumService.searchAlbums(for: artist)
            
        }
    }
    
    
    // Horizontal Stack of Buttons
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
        .padding(.bottom)
    }
}
