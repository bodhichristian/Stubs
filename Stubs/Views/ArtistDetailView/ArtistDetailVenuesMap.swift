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
    let concerts: [Concert]
    
//    @StateObject var viewModel = ArtistDetailVenuesMap.ViewModel()
    
    @State private var location: MKMapItem?
    @State private var position: MapCameraPosition = .automatic
    
    //
    private var uniqueVenueCount: Int {
        return Set(concerts.map {$0.venue}).count
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack{
                Spacer()
                Text("\(uniqueVenueCount) Venues" )
                
                Image(systemName: "mappin.and.ellipse")
                    .foregroundStyle(.green)
                
               
            }
            .font(.title2)
            .fontWeight(.bold)

            
            Map {
                ForEach(concerts, id: \.uuid) { concert in
                    Annotation("", coordinate: CLLocationCoordinate2D(latitude: concert.venueLatitude, longitude: concert.venueLongitude)) {
                        StubThumbnail(concert: concert)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .onAppear {
                //viewModel.getVenueCoordinates(for: concerts)
                
                position = .camera(
                    MapCamera(
                        centerCoordinate: CLLocationCoordinate2D(
                            latitude: concerts[0].venueLatitude,
                            longitude: concerts[0].venueLongitude
                        ),
                        
                        distance: 2000,
                        heading: 100)

                )
            }

        }
        .padding(.horizontal)
        
    }
}

//extension ArtistDetailVenuesMap {
//    
//    class ViewModel: ObservableObject {
//        
//        @Published var venueCoordinates: [CLLocationCoordinate2D] = []
//
//        let mapService = ConcertVenueLocationService()
//        
//        func getVenueCoordinates(for concerts: [Concert]) {
//            for concert in concerts {
//                mapService.getCoordinates(for: concert)
//                
//                let coordinates = CLLocationCoordinate2D(latitude: mapService.latitude, longitude: mapService.longitude)
//                print(coordinates)
//                venueCoordinates.append(coordinates)
//                print(venueCoordinates)
//            }
//            
//        }
//    }
//}

#Preview {
    ArtistDetailVenuesMap(concerts: SampleData.concerts)
}
