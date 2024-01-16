//
//  AddConcertDetails.swift
//  Stubs
//
//  Created by christian on 12/16/23.
//

import SwiftUI
import MapKit

struct StubEditorDetails: View {
    @Binding var concert: Concert
    
    @State private var artistService = ArtistService()
    
    @State private var debounceTimer: Timer?
    
    var body: some View {
        Section("Details") {
            HStack {
                TextField("Artist", text: $concert.artistName)
                
                Image(systemName: concert.artistName.isEmpty ? "person.circle": "person.circle.fill")
                    .foregroundStyle(concert.artistName.isEmpty
                                     ? .gray
                                     : .green)
            }
            
            HStack {
                TextField("Venue", text: $concert.venue)
                    
                Image(
                    systemName: concert.venue.isEmpty
                      ? "mappin.circle"
                      : "mappin.circle.fill"
                )
                    .foregroundStyle(
                        concert.venue.isEmpty
                        ? .gray
                        : .green
                )
            }
            HStack {
                TextField("City", text: $concert.city)
                Image(
                    systemName: concert.city.isEmpty
                      ? "map"
                      : "map.fill"
                )
                    .foregroundStyle(
                        concert.city.isEmpty
                        ? .gray
                        : .green
                )
            }
            DatePicker("Date", selection: $concert.date, displayedComponents: .date)
        }
        .onChange(of: concert.artistName) { oldValue, newValue in
            // Invalidate existing timer
            debounceTimer?.invalidate()
            
            // Start a new timer
            debounceTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false, block: { _ in
                artistService.search(for: concert.artistName)
            })
        }
        .onChange(of: artistService.singleArtistSearchResponse) { oldValue, newValue in
            concert.artist = newValue.first
            
            fetchImageData(from: newValue.first?.strArtistThumb ?? "") { data in
                concert.imageData = data
            }
        }
    }
}


extension StubEditorDetails {
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
}
