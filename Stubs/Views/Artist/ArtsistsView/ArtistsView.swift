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
                                                .frame(width: 40)
                                            
                                            if let data = artist.artistImageData {
                                                Image(uiImage: UIImage(data: data) ?? UIImage())
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 40)
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
                                            .matchedGeometryEffect(id: artist.artistName, in: namespace)
                                        
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
                                        }
                                        .matchedGeometryEffect(id: artist.artistID, in: namespace)

                                        Spacer()
                                        
                                        Text(artist.artistName ?? "")
                                            .font(.headline)
                                            .fontWeight(.semibold)
                                            .multilineTextAlignment(.center)
                                            .lineLimit(3)
                                            .matchedGeometryEffect(id: artist.artistName, in: namespace)
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
                       withAnimation {
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
}
