//
//  MapKitServiceError.swift
//  Stubs
//
//  Created by christian on 3/26/24.
//

import Foundation

enum MapKitServiceError: Error, CustomStringConvertible {
    case failedToFetchCoordinates,
         failedToFetchSnapshotData
    
    var description: String {
        switch self {
        case .failedToFetchCoordinates:
            return "Failed to fetch coordinates for venue."
        case .failedToFetchSnapshotData:
            return "Failed to fetch MKMapSnapshotter data for venue."
        }
    }
}
