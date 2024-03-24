//
//  ArtistServiceError.swift
//  Stubs
//
//  Created by christian on 3/24/24.
//

import Foundation

enum ArtistServiceError: Error, CustomStringConvertible {
    case failedToFetchArtist,
         failedToFetchImages,
         invalidArtistURL,
         invalidImageURL
    
    var description: String {
        switch self {
        case .failedToFetchArtist:
            return "Unable to find artist."
        case .failedToFetchImages:
            return "Unable to fetch artist images."
        case .invalidArtistURL:
            return "Bad URL for artist."
        case .invalidImageURL:
            return "Bad URL for image."
        }
    }
}
