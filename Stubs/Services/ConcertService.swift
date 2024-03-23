//
//  ConcertService.swift
//  Stubs
//
//  Created by christian on 3/23/24.
//

import Foundation

@Observable
class ConcertService {
    let artistService = ArtistService()
    let mapKitService = MapKitService()
    
    var template = Concert(
        artistName: "",
        venue: "",
        city: "",
        date: Date.now,
        iconName: StubStyle.icons.randomElement()!,
        accentColor: StubStyle.colors.randomElement()!,
        notes: "",
        venueLatitude: 0.0,
        venueLongitude: 0.0
    )
    
    func buildConcert(with artist: Artist? = nil) {
        Task {
            do {
                
                try await mapKitService.getCoordinates(for: template)
                
                template.venueLatitude = mapKitService.latitude
                template.venueLongitude = mapKitService.longitude
                
                if let savedArtist = artist {
                    template.artist = savedArtist
                } else {
                    if let newArtist = try await artistService.search(for: template.artistName) {
                        artistService.fetchImageData(from: newArtist.artistImageURL ?? "") { data in
                            newArtist.artistImageData = data
                        }
                        
                        artistService.fetchImageData(from: newArtist.bannerImageURL ?? "") { data in
                            newArtist.bannerImageData = data
                        }
                        
                        template.artist = newArtist
                    }
                }
            }
        }
    }
    
    
}
