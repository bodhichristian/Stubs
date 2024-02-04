//
//  ArtistDetailVenuesMap.swift
//  Stubs
//
//  Created by christian on 12/28/23.
//

import SwiftUI
import SwiftData
import MapKit

struct ArtistDetailVenuesMap: View {
    // Pass in filteredConcerts from ArtistDetailView
    let concerts: [Concert]
    let cameraDistance: Double = 500
    
    @State private var location: MKMapItem?
    @State private var position: MapCameraPosition = .automatic
    
    private var displayStub: Concert {
        return concerts[0]
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Image(systemName: "ticket")
                    .foregroundStyle(.purple)
                Text("\(concerts.count) Stubs" )
                
                Spacer()
            }
            .font(.title2)
            .fontWeight(.bold)
            
            Map(position: $position) {
                ForEach(concerts, id: \.uuid) { concert in
                    
                    Marker(
                        concert.venue,
                        coordinate: CLLocationCoordinate2D(
                            latitude: concert.venueLatitude,
                            longitude: concert.venueLongitude
                        )
                    )
                }
            }
            .mapStyle(
                .standard(
                    elevation: .realistic,
                    pointsOfInterest: .excludingAll
                )
            )
            .frame(maxWidth: .infinity)
            .frame(height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .onAppear {
                updateMapPosition(latitude: displayStub.venueLatitude, longitude: displayStub.venueLongitude)
            }
                        
            ScrollView(.horizontal) {
                HStack {
                    ForEach(concerts, id: \.uuid) { concert in
                        
                        ArtistStubsLabel(concert: concert)
                            .onTapGesture {
                                withAnimation(.easeInOut){
                                    updateMapPosition(latitude: concert.venueLatitude, longitude: concert.venueLongitude)
                                }
                            }
                    }
                }
            }
            .padding(.top)
            
        }
        .padding(.horizontal)
    }
    
    private func updateMapPosition(latitude: Double, longitude: Double) {
        position = .camera(
            MapCamera(
                centerCoordinate: CLLocationCoordinate2D(
                    latitude: latitude,
                    longitude: longitude
                ),
                distance: cameraDistance,
                heading: 100,
                pitch: 80
            )
        )
    }
}
