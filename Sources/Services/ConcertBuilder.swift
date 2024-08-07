//
//  ConcertBuilder.swift
//  Stubs
//
//  Created by christian on 8/6/24.
//

import Foundation

class ConcertBuilder {
    let artistService = ArtistService()
    let mapKitService = MapKitService()
    
    func buildSampleConcert(with artist: Artist? = nil) {
        
        if let artist {
            
        } else {
            let artistName = DebugData.artists.randomElement()!
            let venue = DebugData.venues.randomElement()!
            
            
        }
        
    }
}
