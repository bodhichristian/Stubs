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
    @Query private var artists: [Artist]
    @Query(sort: \Concert.date) private var concerts: [Concert]
    @State private var concertService = ConcertService()
    @State private var filteringFavorites = false
    @State private var isAddingConcert = false
    @State private var searchText = ""
    
    private let addConcertTip = AddConcertTip()
    private let searchPrompt = "Search Concerts"
    
    var body: some View {
        NavigationStack {
            VStack {
                if concerts.isEmpty {
                    NoStubsView()
                } else  {
                    ScrollView{
                        VStack(alignment: .leading)  {
                            ForEach(concertsByYear.keys.sorted().reversed(), id: \.self) { year in
                                Section(header: yearHeader(year)) {
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
            .navigationTitle("\(concerts.count) Stubs")
            .sheet(isPresented: $isAddingConcert) {
                StubEditor(addConcertTip: addConcertTip)
            }
            .toolbar {
//                                ToolbarItem(placement: .topBarLeading) {
//                                    Button {
//                                       Task {
//                                           try await addSampleConcert()
//                                       }
//                                    } label: {
//                                        ToolbarButtonLabel(
//                                            text: "Demo",
//                                            symbol: "sparkles.rectangle.stack",
//                                            colors: [.blue, .purple]
//                                        )
//                                    }
//                                }
                
                
                ToolbarItem {
                    Button {
                        Task {
                            try await addSampleConcert()
                        }
//                        withAnimation(.snappy){
//                            filteringFavorites.toggle()
//                        }
                    } label: {
                        FavoriteToggleLabel(filteringFavorites: filteringFavorites)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        //                        Task {
                        //                            try await addSampleConcert()
                        //                        }
                        isAddingConcert = true
                    } label: {
                        ToolbarButtonLabel(
                            text: "Add Concert",
                            symbol: "plus.circle"
                        )
                        .accessibilityIdentifier("AddConcertButton")
                    }
                    .popoverTip(addConcertTip, arrowEdge: .top)
                }
            }
            .tint(.primary)
        }
        //         Clear SwiftData store
//                            .onAppear {
//                                modelContext.container.deleteAllData()
//                            }
    }
    
}

extension StubCollection {
    // MARK: addSampleConcert()
    private func addSampleConcert() async throws {
        let artistName = DebugData.artists.randomElement()!.lowercased()
        
        let artistID = artists.first(where: {$0.artistName?.lowercased() == artistName})?.artistID
        
        let descriptor = FetchDescriptor<Artist>(predicate: #Predicate { $0.artistID == artistID })
        let existingArtists = try modelContext.fetch(descriptor)
        
        if let existingArtist = existingArtists.first {
            let concert = try await concertService.buildSampleConcert(with: existingArtist)
            modelContext.insert(concert) 
            try modelContext.save()
        } else {
            let concert = try await concertService.buildSampleConcert()
            modelContext.insert(concert)
            try modelContext.save()
        }
    }
    
    // Delete concert
    private func delete(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(concerts[index])
            }
        }
    }
    
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
    
    // Concerts sorted into year groups
    private var concertsByYear: [Int: [Concert]] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        
        let groups = Dictionary(grouping: filteredConcerts) { concert in
            let year = Calendar.current.component(.year, from: concert.date)
            return year
        }
        
        return groups.mapValues { concerts in
            concerts.sorted { concert1, concert2 in
                concert1.date > concert2.date
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
}
