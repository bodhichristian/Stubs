//
//  VenueCoordinateService.swift
//  Stubs
//
//  Created by christian on 12/28/23.
//

import Foundation
import MapKit

class ConcertVenueLocationService: ObservableObject {
    
    @Published var latitude: Double = 0.0
    @Published var longitude: Double = 0.0
    
    func getCoordinates(for concert: Concert) {
        let request = MKLocalSearch.Request()
        let query = concert.venue + " venue " + concert.city
        
        request.naturalLanguageQuery = query
        request.resultTypes = .pointOfInterest
        
        Task {
            print("searching for \(query)")
            let search = MKLocalSearch(request: request)
            let response = try? await search.start()
            latitude = response?.mapItems[0].placemark.coordinate.latitude ?? 0
            longitude = response?.mapItems[0].placemark.coordinate.longitude ?? 0
        }
    }
}
