//
//  ProfileView.swift
//  Stubs
//
//  Created by christian on 8/1/24.
//

import SwiftUI

struct ProfileView: View {
    let concerts: [Concert]
    let artists: [Artist]
    
    private var topArtists: [Artist] {
        let sortedArtists = artists.sorted(by: {$0.concerts?.count ?? 0 > $1.concerts?.count ?? 0})
        
        return Array(sortedArtists.prefix(3))
    }
    
    private var venues: [Concert] {
        var uniqueVenues = Set<String>()
        
        return concerts.filter { concert in
            if !uniqueVenues.contains(concert.venue) {
                uniqueVenues.insert(concert.venue)
                return true
            }
            return false
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {

                    VStack {
                        // Top Stats
                        ZStack  {
                            LinearGradient(colors: [.orange, .brown, .green, .blue, .yellow, .red, .orange, .brown, .green, .yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            TileBase()
                                .foregroundStyle(.thinMaterial)
                            
                            HStack  {
                                VerticalLineBoundary()
                                    .padding(.leading, 20)
                                
                                ProfileStatLabel(number: concerts.count, label: "Stubs")
                                ProfileStatLabel(number: artists.count, label: "Artists")
                                ProfileStatLabel(number: venues.count, label: "Venues")
                                
                                VerticalLineBoundary()
                                    .padding(.trailing, 20)
                            }
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            
                        }
                        .frame(height: 160)
                        .padding(.horizontal, 2)
                        .padding(.vertical)
                        
                        TopArtistsView(artists: topArtists)
                    }
                    
                    // Top Venues
                    VStack(alignment: .leading) {
                        Text("Top Venues")
                            .font(.title3)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ForEach(0..<3){ i in
                            HStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 44, height: 44)
                                
                                Text("\(i + 1)")
                                    .fontWeight(.bold)
                                
                                Text(DebugData.venues.randomElement()!.name)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text("7 Visits")
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    .padding(.bottom, 80)
                    .ignoresSafeArea()
                }
                .padding(.horizontal)
            }
            .navigationTitle("Christian")
            .toolbar {
                ToolbarItem {
                    Button {
                        // Open Settings
                    } label: {
                        ToolbarButtonLabel(text: "Settings", symbol: "gear")
                        
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}

#Preview {
    
    TabBarContainer(selection: .constant(TabBarItem.profile)){
        NavigationStack {
            ProfileView(concerts: [Concert](), artists: [Artist]())
                .navigationTitle("Christian")
        }
    }
}




