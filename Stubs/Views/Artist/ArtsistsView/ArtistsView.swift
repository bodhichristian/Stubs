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
            
            //                if listView {
            //                    Text("hi")
            //                    List {
            //                        ForEach(artists, id: \.artistID){ artist in
            //
            //
            //                            NavigationLink {
            //                                ArtistDetailView(artist: artist)
            //                            } label: {
            //
            //
            //
            //                                HStack {
            //
            //
            ////                                    AsyncImage(url: URL(string: artist.strArtistThumb ?? "")) { phase in
            ////                                        switch phase {
            ////                                            case .empty:
            ////                                                ProgressView()
            ////                                            case .success(let image):
            ////                                                image.resizable()
            ////                                            case .failure:
            ////                                                Text("Image not available")
            ////                                            default:
            ////                                                EmptyView()
            ////                                        }
            ////                                    }
            ////
            ////
            //
            //                                    AsyncImage(url: URL(string: artist.artistImageURL ?? "")) { image in
            //                                        image
            //                                            .resizable()
            //                                            .matchedGeometryEffect(id: artist.artistName, in: namespace)
            //                                            .scaledToFit()
            //                                            .frame(width: 40)
            //                                            .clipShape(Circle())
            //                                            //.opacity(imageOpacity)
            ////                                                        .onAppear {
            ////                                                            withAnimation(.easeInOut(duration: 1.5)){
            ////                                                                imageOpacity = 1.0
            ////                                                            }
            ////                                                        }
            //
            //                                    } placeholder: {
            //
            //                                        Circle()
            //                                            .foregroundStyle(.gray)
            //                                            .frame(width: 75)
            //                                            .padding()
            //
            //                                    }
            //                                    Text(artist.artistName ?? "")
            //                                        .font(.headline)
            //                                        .fontWeight(.semibold)
            //
            //
            //                                }
            //
            //
            //                            }
            //                        }
            //
            //
            //                    }
            //                } else {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(artists, id: \.artistID){ artist in
                        
                        
                        NavigationLink {
                            ArtistDetailView(artist: artist)
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                
                                    .foregroundStyle(.ultraThinMaterial)
                                
                                
                                VStack {
                                    ZStack(alignment: .bottomTrailing) {
                                        
                                        
                                        
                                        
                                        AsyncImage(url: URL(string: artist.artistImageURL ?? "")) { image in
                                            image
                                                .resizable()
                                                .matchedGeometryEffect(id: artist.artistID, in: namespace)
                                                .scaledToFit()
                                                .frame(width: 75)
                                                .clipShape(Circle())
                                            //.opacity(imageOpacity)
                                            //                                                        .onAppear {
                                            //                                                            withAnimation(.easeInOut(duration: 1.5)){
                                            //                                                                imageOpacity = 1.0
                                            //                                                            }
                                            //                                                        }
                                            
                                        } placeholder: {
                                            
                                            Circle()
                                                .foregroundStyle(.gray)
                                                .frame(width: 75)
                                                .padding()
                                            
                                        }
                                        
                                        
                                        
                                        
                                        
                                        
                                        StubCountIndicator(artist: artist)
                                    }
                                    Spacer()
                                    Text(artist.artistName ?? "")
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.center)
                                        .lineLimit(3)
                                    
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
            }
            
            
            .navigationTitle("Artists")
            .toolbar {
                ToolbarItem {
                    Button {
                        listView.toggle()
                        
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
