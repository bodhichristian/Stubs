//
//  AlbumsByArtist.swift
//  Stubs
//
//  Created by christian on 12/13/23.
//

import SwiftUI
import Combine

struct AlbumsByArtist: View {
    let concert: Concert
    
    @StateObject var viewModel = AlbumsByArtist.ViewModel()

    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            Text("Albums")
                .font(.title2.bold())
            
            ScrollView(.horizontal) {
                
                HStack {
                    if viewModel.albums.isEmpty {
                        ForEach(0..<5) { _ in
                            RoundedRectangle(cornerRadius: 15)
                                .fill(.secondary.opacity(0.1))
                                .frame(width: 100, height: 100)
                                .shadow(radius: 3, x: 5, y: 5)
  
                        }
                    } else {
                        ForEach(viewModel.albums.sorted { $0.intYearReleased ?? "" > $1.intYearReleased ?? ""}, id: \.idAlbum) { album in
                            
                            VStack(alignment: .leading) {
                                AsyncImage(url: URL(string: album.strAlbumThumb ?? "")) { image in image.resizable().scaledToFit()
                                } placeholder: {
                                    Color.secondary.opacity(0.1)
                                }
                                .frame(width: 86, height: 86)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .shadow(radius: 3, x: 5, y: 5)
                                
                                
                                
                                Text(album.strAlbum ?? "")
                                    .font(.headline)
                                    .frame(maxWidth: 100, alignment: .leading)
                                    .lineLimit(1)
                                
                                Text(album.intYearReleased ?? "")
                                
                            }
                        }
                    }
                }
                .padding(.vertical)
            }
            Spacer()
        }
        .padding(.vertical)
        .onAppear {
            viewModel.searchAlbums(for: concert.artist)
        }
    }
}

#Preview {
    AlbumsByArtist(concert: SampleData.concerts[0])
}

extension AlbumsByArtist {
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
}
