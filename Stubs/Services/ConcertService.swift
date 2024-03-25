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
        do {
            try await fetchArtist(artist)
            try await getVenueCoordinates()
        } catch {
            throw error
        }
    }
    
    private func fetchArtist(_ artist: Artist?) async throws {
        if let savedArtist = artist {
            template.artist = savedArtist
        } else {
            do {
                try await artistService.search(for: template.artistName)
                template.artist = artistService.fetchedArtist
            } catch {
                throw ArtistServiceError.failedToFetchArtist
            }
        }
    }
    
    private func getVenueCoordinates() async throws {
        do {
            let coordinates = try await mapKitService.getCoordinates(for: template)
            template.venueLatitude = coordinates.0
            template.venueLatitude = coordinates.1
        } catch {
            throw error
        }
    }
}
