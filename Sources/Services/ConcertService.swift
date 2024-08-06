//
//  ConcertService.swift
//  Stubs
//
//  Created by christian on 3/23/24.
//

import Foundation
import SwiftUI
import MapKit

@Observable
class ConcertService {
    let artistService = ArtistService()
    
#if os(iOS)
    let mapKitService = MapKitService()
    #endif
    
    var template = Concert(
        iconName: StubStyle.icons.randomElement()!,
        accentColor: StubStyle.colors.randomElement()!
    )
    
    public func buildConcert(with artist: Artist? = nil) async throws {
        try await fetchArtist(artist)
        try await getVenueCoordinates()
        try await getMapSnapshotData()
    }
    
    public func buildSampleConcert(with artist: Artist? = nil) async throws -> Concert {
        let sampleConcert = Concert()
        let venue = DebugData.venues.randomElement()!
        
        sampleConcert.artistName = DebugData.artists.randomElement()!
        sampleConcert.city = venue.city
        sampleConcert.venueName = venue.name
        sampleConcert.venue?.latitude = venue.latitude
        sampleConcert.venue?.longitude = venue.longitude
        sampleConcert.accentColor = StubStyle.colors.randomElement()!
        sampleConcert.iconName = StubStyle.icons.randomElement()!
        sampleConcert.notes = DebugData.notes.randomElement()!
        sampleConcert.isFavorite = Bool.random()
        sampleConcert.date = calendar.date(
            from: DateComponents(
                year: Int.random(
                    in: 2015...2023),
                month: Int.random(in: 1...12),
                day: Int.random(in: 1...28)
            )
        )!
        
        if let artist {
            print("➡️ Building concert with existing artist: \(artist.artistName ?? "")")
            sampleConcert.artist = artist
        } else {
            print("🆕 Fetching new artist for concert")
            try await artistService.search(for: sampleConcert.artistName)
            sampleConcert.artist = artistService.fetchedArtist
        }
        #if os(iOS)
        if let venue = sampleConcert.venue {
            sampleConcert.mapSnapshotData = try await mapKitService.getMapSnapshot(
                for: CLLocationCoordinate2D(latitude: venue.latitude, longitude: venue.longitude)
            )
        }
        #endif
        return sampleConcert
    }
    
    private func fetchArtist(_ artist: Artist? = nil) async throws {
        if let savedArtist = artist {
            template.artist = savedArtist
        } else {
            try await artistService.search(for: template.artistName)
            template.artist = artistService.fetchedArtist
        }
    }
    
    private func getVenueCoordinates() async throws {
        #if os(iOS)
        if let venue = template.venue {
            let coordinates = try await mapKitService.getCoordinates(for: template)
            venue.latitude = coordinates.latitude
            venue.latitude = coordinates.longitude
        }
        #endif

    }
    
    private func getMapSnapshotData() async throws {
        #if os(iOS)
        if let venue = template.venue {
            template.mapSnapshotData = try await mapKitService.getMapSnapshot(
                for: CLLocationCoordinate2D(latitude: venue.latitude, longitude: venue.longitude)
            )
        }
        #endif
    }
}







