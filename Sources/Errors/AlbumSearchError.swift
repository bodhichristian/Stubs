//
//  AlbumSearchError.swift
//  Stubs
//
//  Created by christian on 3/24/24.
//

import Foundation

enum AlbumSearchError: Error, CustomStringConvertible {
    case invalidArtistID,
         unknownArtistID
    
    var description: String {
        switch self {
        case .invalidArtistID:
            return "An Artist ID must only contain digits."
        case .unknownArtistID:
            return "Artist ID does not match any known artists."
        }
    }
}
