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
    var mapSnapshotData: Data?
    
    func getCoordinates(for concert: Concert) async throws -> (Double, Double) {
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
            throw MapKitServiceError.failedToFetchCoordinates
        }
        
        latitude = coordinates.latitude
        longitude = coordinates.longitude
        
        return (coordinates.latitude, coordinates.longitude)
    }
    
    func getMapSnapshot() async throws -> Data?  {
        let options = MKMapSnapshotter.Options()
        options.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), latitudinalMeters: 200, longitudinalMeters: 200)
        options.size = CGSize(width: 360, height: 150)
        options.scale = await UIScreen.main.scale
        options.mapType = .satelliteFlyover
        options.camera = MKMapCamera(
            lookingAtCenter: CLLocationCoordinate2D(
                latitude: latitude,
                longitude: longitude
            ),
            fromDistance: 400,
            pitch: 70,
            heading: 0
        )

        let snapshotter = MKMapSnapshotter(options: options)

        do {
            let snapshot = try await snapshotter.start()
            return snapshot.image.jpegData(compressionQuality: 1.0)
        } catch {
            throw MapKitServiceError.failedToFetchSnapshotData
        }
    }
 
}
