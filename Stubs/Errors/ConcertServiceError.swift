//
//  ConcertServiceError.swift
//  Stubs
//
//  Created by christian on 3/25/24.
//

import Foundation

enum ConcertServiceError: Error, CustomStringConvertible {
    case failedToBuildConcert
    
    var description: String {
        switch self {
        case .failedToBuildConcert:
            return "Failed to create Concert object."
        }
    }
}
