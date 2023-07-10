//
//  VenueMapView.swift
//  Stubs
//
//  Created by christian on 6/26/23.
//

import SwiftUI
import MapKit

struct VenueMapView: View {
    let concert: Concert
    let defaultCoordinates = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    
    @State private var location: MKMapItem?
    @State private var position: MapCameraPosition = .automatic
    @State private var route: MKRoute?

    @Environment(\.dismiss) var dismiss
    
    var query: String { // Creates the location query
        return concert.venue + " " + concert.city
    }
    
    var body: some View {
        NavigationStack {
            ZStack { // Apple Maps base
                Map(position: $position, selection: $location) {
                    Marker(concert.venue, coordinate: location?.placemark.coordinate ?? defaultCoordinates)
                    
                    Annotation(concert.venue, coordinate: location?.placemark.coordinate ?? defaultCoordinates) {
                        StubView(concert: concert, size: .small)
                            .offset(y: -120)
                    }
                }
                
                VStack { // Look Around preview
                    Spacer()
                    if let location {
                        ItemInfoView(location: location)
                            .frame(height: 128)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding([.top, .horizontal])
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Cancel")
                        .onTapGesture {
                            dismiss()
                        }
                }
            }
            .onAppear {
                search(for: query)
            }
        }
    }
    
    func search(for query: String) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        request.resultTypes = .pointOfInterest
        
        Task {
            let search = MKLocalSearch(request: request)
            let response = try? await search.start()
            location = response?.mapItems[0] ?? [][0]
            position = .camera(MapCamera(centerCoordinate: location?.placemark.coordinate ?? defaultCoordinates, distance: 1500, heading: 242, pitch: 60))
        }
    }
}

#Preview {
    VenueMapView(concert: SampleData.concerts[0])
}
