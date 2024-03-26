//
//  ConcertService.swift
//  Stubs
//
//  Created by christian on 3/23/24.
//

import Foundation
import SwiftUI

@Observable
class ConcertService {
    let artistService = ArtistService()
    let mapKitService = MapKitService()
    
    var template = Concert(
        iconName: StubStyle.icons.randomElement()!,
        accentColor: StubStyle.colors.randomElement()!
    )
    
    func buildConcert(with artist: Artist? = nil) async throws {
        try await fetchArtist(artist)
        try await getVenueCoordinates()
        try await getMapSnapshotData()
    }
    
    func buildSampleConcert() {
        template.artistName = DebugData.artists.randomElement()!
        template.venue = DebugData.venues.randomElement()!.name
        template.notes = DebugData.notes.randomElement()!
        template.isFavorite = Bool.random()
        template.date = calendar.date(
            from: DateComponents(
                year: Int.random(
                    in: 2015...2023),
                month: Int.random(in: 1...12),
                day: Int.random(in: 1...28)
            )
        )!
    }
    
    private func fetchArtist(_ artist: Artist?) async throws {
        if let savedArtist = artist {
            template.artist = savedArtist
        } else {
            try await artistService.search(for: template.artistName)
            template.artist = artistService.fetchedArtist
        }
    }
    
    private func getVenueCoordinates() async throws {
        let coordinates = try await mapKitService.getCoordinates(for: template)
        template.venueLatitude = coordinates.0
        template.venueLatitude = coordinates.1
    }
    
    private func getMapSnapshotData() async throws {
        template.mapSnapshotData = try await mapKitService.getMapSnapshot()
    }
    
    
}







