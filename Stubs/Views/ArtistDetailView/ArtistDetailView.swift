//
//  ArtistDetailView.swift
//  Stubs
//
//  Created by christian on 12/28/23.
//

import SwiftData
import SwiftUI
import Combine
import MapKit

struct ArtistDetailView: View {
    
    let artist: String
    
    let artistImageWidth: CGFloat = 200
    
    @Environment(\.dismiss) var dismiss
    
    @Query var concerts: [Concert]

    @StateObject var viewModel = ArtistDetailView.ViewModel()

    
    private var filteredConcerts: [Concert] {
        return concerts.filter({$0.artist == artist })
    }
    
    
    
    @State private var imageOpacity = 0.0
    
    var body: some View {
        GeometryReader { geo in
            ZStack {

                VStack {
                    
                    ZStack {
                        
                        Rectangle()
                        
                        if let artist = viewModel.artists.first {
                            AsyncImage(url: URL(string: artist.strArtistFanart ?? "")) { backgroundImage in
                                backgroundImage
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: geo.size.width, height: geo.size.width / 2)
                                    .clipShape(Rectangle())
                                    .opacity(imageOpacity)
                                    .overlay {
                                        LinearGradient(colors: [.white, .black], startPoint: .top, endPoint: .bottom)
                                            .opacity(0.6)
                                    }

                            } placeholder: {
                                
                                Rectangle()

                            }

                        }
                        
                        
                    }
                    .frame(maxWidth: geo.size.width, maxHeight: geo.size.width / 2)
                    
                    Spacer()
                }
                .ignoresSafeArea()
                
                

                
                VStack(spacing: 0) {
                    
                    ZStack {
                        
                        Circle()
                            .foregroundStyle(.gray)
                            .frame(width: artistImageWidth)
                            .padding()
                            
                        if let artist = viewModel.artists.first {
                            AsyncImage(url: URL(string: artist.strArtistThumb ?? "")) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: artistImageWidth)
                                    .clipShape(Circle())
                                    .opacity(imageOpacity)
                                    .shadow(radius: 7,  y: 7)
                                    .padding()
                                    .onAppear {
                                        withAnimation(.easeInOut(duration: 0.7)){
                                            imageOpacity = 1.0
                                        }
                                    }
                                    
                            } placeholder: {
                                
                                Circle()
                                    .foregroundStyle(.gray)
                                    .frame(width: artistImageWidth)
                                    .padding()

                            }
                            
                            
                            
                        }

                    }
                    .padding(.top, 40)
                    
                    
                    
                    Text(artist)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    
                    if let artist = viewModel.artists.first {
                        HStack(spacing: 0) {
                            Text(artist.strGenre ?? "")
                            Text(" | ")
                            Text(artist.strCountry ?? "")
                                .bold()
                        }
                    } else {
                        
                        Text( " " )
                    }
                    
                    
                    Divider()
                        .padding(.horizontal, 80)
                        .padding(.vertical, 15)
                    
                    
                    ScrollView {

                    
                        
                        VStack(alignment: .leading) {
                            
                            
                            
                            
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 10)
                        
                        ArtistDetailVenuesMap(concerts: filteredConcerts)
                        
                       // Spacer()
                    }
                }
                
                HStack(spacing: 4) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text("Back")
    //                    .font(.title3)
                }
                .onTapGesture {
                    dismiss()
                }
                .offset(x: -4, y: -12)

                .foregroundStyle(.blue)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding()
                
            }
            .toolbar(.hidden, for: .navigationBar)
            
            
            //.navigationBarTitleDisplayMode(.inline)
            //.navigationTitle(concert.artist)
            .onAppear {
                withAnimation(.bouncy){
                    viewModel.search(artist)
                }
            }
        }
    }
}

extension ArtistDetailView {
    class ViewModel: ObservableObject {
        private let artistService = ArtistSearchService()
        private var cancellables = Set<AnyCancellable>()
        
        @Published var artists: [Artist] = []
        
        func search(_ artist: String) {
            artistService.$artists
                .receive(on: DispatchQueue.main)
                .sink { [weak self] in self?.artists = $0 }
                .store(in: &cancellables)
            
            artistService.search(for: artist)
            
        }
    }
}

#Preview {
    ArtistDetailView(artist: SampleData.concerts[0].artist)
}
