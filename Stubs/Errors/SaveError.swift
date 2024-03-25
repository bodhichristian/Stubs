//
//  SaveError.swift
//  Stubs
//
//  Created by christian on 3/25/24.
//

import Foundation

enum SaveError: Error, CustomStringConvertible {
    case failedToSaveConcert
    
    var description: String {
        switch self {
        case .failedToSaveConcert:
            return "Failed to save object to model context."
        }
    }
}
