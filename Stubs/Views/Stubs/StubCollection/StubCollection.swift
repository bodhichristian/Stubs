//
//  StubCollection.swift
//  Stubs
//
//  Created by christian on 6/8/23.
//

import SwiftUI
import SwiftData
import TipKit

struct StubCollection: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.modelContext) var modelContext
    @Namespace var namespace
    @Query(sort: \Concert.date) private var concerts: [Concert]
    
    @State private var isAddingConcert = false
    @State private var searchText = ""
    @State private var filteringFavorites = false

    
    private let addConcertTip = AddConcertTip()
    private let service = ArtistService()
    private let searchPrompt = "Search Concerts"
    
    var body: some View {
        NavigationStack {
            VStack {
                if concerts.isEmpty {
                    NoStubsView()
                } else  {
                    ScrollView{
                        VStack(alignment: .leading)  {
                            // Sort concerts in reverse chronological order
                            ForEach(concertsByYear.keys.sorted().reversed(), id: \.self) { year in
                                // Create a section for each decade
                                Section(header: yearHeader(year)) {
                                    // Create a NavLink to StubDetailView for each concert
                                    ForEach(concertsByYear[year] ?? [Concert](), id: \.id) { concert in
                                        NavigationLink {
                                            StubDetailView(concert: concert)
                                        } label: {
                                            ZStack {
                                                StubTile(concert: concert)
                                                HStack{
                                                    StubCollectionRowLabel(concert: concert)
                                                    Spacer()
                                                    
                                                    Image(systemName: "chevron.right")
                                                        .foregroundStyle(.secondary.opacity(0.5))
                                                        .frame(width: 10)
                                                        .padding(.trailing, 10)
                                                }
                                                .padding(.vertical, 10)
                                                .padding(.leading, 20)
                                            }
                                        }
                                        .buttonStyle(PlainButtonStyle())
                                    }
                                }
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal)
                        .padding(.bottom, 65)
                        .searchable(text: $searchText, prompt: searchPrompt)
                        
                    }
                }
            }
            
            .navigationTitle("Stubs")
            .sheet(isPresented: $isAddingConcert) {
                StubEditor(addConcertTip: addConcertTip)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        addSampleConcert()
                    } label: {
                        ToolbarButtonLabel(
                            text: "Demo",
                            symbol: "sparkles.rectangle.stack",
                            colors: [.blue, .purple]
                        )
                    }
                }
                
                ToolbarItem {
                    Button {
                        withAnimation(.snappy){
                            filteringFavorites.toggle()
                        }
                    } label: {
                        FavoriteToggleLabel(filteringFavorites: filteringFavorites)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isAddingConcert = true
                    } label: {
                        ToolbarButtonLabel(
                            text: "Add Concert",
                            symbol: "plus.circle",
                            colors: [.yellow, .orange, .red]
                        )
                    }
                    .popoverTip(addConcertTip, arrowEdge: .top)

                }
            }
            .tint(.primary)

        }
        .refreshable {
            
        }
    }
}

extension StubCollection {
    // Concerts whose data contains searchText
    private var filteredConcerts: [Concert] {
        if searchText.isEmpty {
            if filteringFavorites {
                return concerts.filter { $0.isFavorite }
            } else {
                return concerts
            }
            
        } else {
            // Search filter
            return concerts.filter { concert in
                return concert.artistName.lowercased().contains(searchText.lowercased()) ||
                concert.venue.lowercased().contains(searchText.lowercased()) ||
                concert.city.lowercased().contains(searchText.lowercased()) ||
                concert.date.formatted().contains(searchText)
            }
        }
    }
    // Concerts sorted into decade groups
    private var concertsByYear: [Int: [Concert]] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        
        let groups = Dictionary(grouping: filteredConcerts) { concert in
            let year = Calendar.current.component(.year, from: concert.date)
            //let decade = (year / 10) * 10 // Round down to the nearest decade
            return year
        }
        
        return groups.mapValues { concerts in
            concerts.sorted { concert1, concert2 in
                concert1.date > concert2.date
            }
        }
    }
    
    // MARK: - Methods
    
    // MARK: fetchImageData(from urlString:)
    private func fetchImageData(from urlString: String, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            completion(data)
        }
        task.resume()
    }
    
    // MARK: addSampleConcert()
    private func addSampleConcert() {
        
        let artistName = DebugData.artists.randomElement()!
        let venue = DebugData.venues.randomElement()!
        let notes = DebugData.notes.randomElement()!
        let icon = StubStyle.icons.randomElement()!
        let color = StubStyle.colors.randomElement()!
        let isFavorite = Bool.random()
        let date = calendar.date(
            from: DateComponents(
                year: Int.random(
                    in: 2015...2023),
                month: Int.random(in: 1...12),
                day: Int.random(in: 1...28)
            )
        )!
        
        Task {
            if let artist = try await service.search(for: artistName) {
                
                fetchImageData(from: artist.artistImageURL ?? "") { data in
                    artist.artistImageData = data
                }
                
                fetchImageData(from: artist.bannerImageURL ?? "") { data in
                    artist.bannerImageData = data
                }
                
                let newConcert = Concert(
                    artistName: artistName,
                    venue: venue.name,
                    city: venue.city,
                    date: date,
                    iconName: icon,
                    accentColor: color,
                    notes: notes,
                    isFavorite: isFavorite,
                    venueLatitude: venue.latitude,
                    venueLongitude: venue.longitude
                )
                
                newConcert.artist = artist
                
                await ArtistsViewOptionsTip.addArtistEvent.donate()
                
                modelContext.insert(newConcert)
            } else {
                print("there was an error adding the sample artist.")
            }
        }
        
        
        
    }
    
    
    // Header for decade sections in list
    private func yearHeader(_ decade: Int) -> some View {
        HStack {
            Text(("\(decade)")
                .replacingOccurrences(of: ",", with: ""))
            .textCase(nil)
            .font(.title2)
            .bold()
            .foregroundStyle(.secondary)
            
            VStack {
                Divider()
            }
        }
        .padding(.vertical, 15)
        
    }
    
    // Delete concert
    private func delete(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(concerts[index])
            }
        }
    }
}
