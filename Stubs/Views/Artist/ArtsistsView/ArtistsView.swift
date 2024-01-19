//
//  ArtistsView.swift
//  Stubs
//
//  Created by christian on 12/29/23.
//

// TODO: Find a way to load images in this view and pass to detail views. Currently artist images load here.



import SwiftUI
import SwiftData

struct ArtistsView: View {
    
    @Query var concerts: [Concert]
    @Namespace var namespace
    
    @State private var model = ArtistService()
    
    @State private var listView = false
    
    
    let columns = [
        GridItem(.adaptive(minimum: 120))
    ]
    
    
    private var artists: [Artist] {
        var artists = [Artist]()
        
        for concert in concerts {
            artists.append(concert.artist)
        }
        
        let uniqueArtists = Set(artists)
        let sortedArists = Array(uniqueArtists).sorted { $0.artistName ?? "" < $1.artistName ?? "" }
        return sortedArists
    }
    
    var body: some View {
        NavigationStack {
            
            ScrollView {
                
                
                
                if listView {
                    
                    VStack {
                        ForEach(artists, id: \.artistID){ artist in
                            NavigationLink {
                                ArtistDetailView(artist: artist)
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .foregroundStyle(.ultraThinMaterial)
                                        // use smallest, unused piece of unique data as reference
                                        .matchedGeometryEffect(id: artist.artistImageURL, in: namespace)
                                    
                                    HStack {
                                        ZStack {
                                            Circle()
                                                .foregroundStyle(.gray)
                                                .frame(width: 44)
                                            
                                            if let data = artist.artistImageData {
                                                Image(uiImage: UIImage(data: data) ?? UIImage())
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 44)
                                                    .clipShape(Circle())

                                            }
                                            
                                        }
                                        .matchedGeometryEffect(id: artist.artistID, in: namespace)

                                        .padding(.trailing)
                                        
                                        Text(artist.artistName ?? "")
                                            .font(.headline)
                                            .fontWeight(.semibold)
                                            .multilineTextAlignment(.center)
                                            .lineLimit(3)
                                            .padding(.trailing)
                                            .opacity(listView ? 1 : 0)


                                        
                                        StubCountIndicator(artist: artist)
                                            .matchedGeometryEffect(id: artist.bannerImageURL, in: namespace)
                                        Text(stubCount(for: artist) > 1 ? "Stubs" : "Stub")
                                            .foregroundStyle(.secondary)
                                        Spacer()
                                    }
                                    .padding()
                                }
                            }
                            .buttonStyle(PlainButtonStyle())

                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 100)
                    
                } else {
                    LazyVGrid(columns: columns) {
                        ForEach(artists, id: \.artistID){ artist in

                            NavigationLink {
                                ArtistDetailView(artist: artist)
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .foregroundStyle(.ultraThinMaterial)
                                    // use smallest, unused piece of unique data as reference
                                    .matchedGeometryEffect(id: artist.artistImageURL, in: namespace)
                                    
                                    
                                    VStack {
                                        ZStack(alignment: .bottomTrailing) {
                                            Circle()
                                                .foregroundStyle(.gray)
                                                .frame(width: 75)
                                            
                                            if let data = artist.artistImageData {
                                                Image(uiImage: UIImage(data: data) ?? UIImage())
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 75)
                                                    .clipShape(Circle())

                                            }
                                            
                                            StubCountIndicator(artist: artist)
                                                .offset(x: 4, y: 4)
                                                .matchedGeometryEffect(id: artist.bannerImageURL, in: namespace)
                                        }
                                        .matchedGeometryEffect(id: artist.artistID, in: namespace)

                                        Spacer()
                                        
                                        Text(artist.artistName ?? "")
                                            .font(.headline)
                                            .fontWeight(.semibold)
                                            .multilineTextAlignment(.center)
                                            .lineLimit(3)
                                            .opacity(listView ? 0 : 1)

                                        
                                        Spacer()
                                    }
                                    .padding([.top, .horizontal])
                                }
                            }
                            .frame(minHeight: 150)
                            
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 100)

                }
            }
            
            
            .navigationTitle("Artists")
            .toolbar {
                ToolbarItem {
                    Button {
                        withAnimation(.bouncy) {
                           listView.toggle()
                       }
                    } label: {
                        Label(
                            "Toggle List View",
                            systemImage: listView
                            ? "square.grid.2x2"
                            : "list.bullet"
                        )
                    }
                }
            }
        }
        
    }
    
    private func stubCount(for artist: Artist) -> Int {
        var count = 0
        
        for concert in concerts {
            if concert.artistName.lowercased() == artist.artistName?.lowercased() {
                count += 1
            }
        }
        
        return count
    }
}
