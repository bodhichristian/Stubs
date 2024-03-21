//
//  MapKitService.swift
//  Stubs
//
//  Created by christian on 3/21/24.
//

import Foundation
import MapKit

@Observable
class MapKitService {
    var latitude: Double = 0
    var longitude: Double = 0
    
    func getCoordinates(for concert: Concert) async throws {
        // Construct search request using concert details
        let request = MKLocalSearch.Request()
        let query = concert.venue + " venue " + concert.city
        
        request.naturalLanguageQuery = query
        request.resultTypes = .pointOfInterest
        
        // Debug print for query search
        print("searching for \(query)")
        
        // Initialize and start search
        let search = MKLocalSearch(request: request)
        let response = try? await search.start()
        
        // Ensure coordinates are available, else throw error
        guard let coordinates = response?.mapItems.first?.placemark.coordinate 
        else  {
            throw NSError(
                domain: "LocationError",
                code: 0,
                userInfo: [NSLocalizedDescriptionKey: "Unable to find location"]
            )
        }
        
        latitude = coordinates.latitude
        longitude = coordinates.longitude
    }
    
}
