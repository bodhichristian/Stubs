//
//  AddConcertDetails.swift
//  Stubs
//
//  Created by christian on 12/16/23.
//

import SwiftUI
import MapKit

struct StubDetailsForm: View {
    @Binding var concert: Concert
    
    var body: some View {
        Section("Details") {
            HStack {
                TextField("Artist", text: $concert.artist)
                
                Image(systemName: concert.artist.isEmpty ? "person.circle": "person.circle.fill")
                    .foregroundStyle(concert.artist.isEmpty
                                     ? .gray
                                     : .green)
            }
            
            HStack {
                TextField("Venue", text: $concert.venue)
                    
                Image(
                    systemName: concert.venue.isEmpty
                      ? "mappin.circle"
                      : "mappin.circle.fill"
                )
                    .foregroundStyle(
                        concert.venue.isEmpty
                        ? .gray
                        : .green
                )
            }
            HStack {
                TextField("City", text: $concert.city)
                Image(
                    systemName: concert.city.isEmpty
                      ? "map"
                      : "map.fill"
                )
                    .foregroundStyle(
                        concert.city.isEmpty
                        ? .gray
                        : .green
                )
            }
            DatePicker("Date", selection: $concert.date, displayedComponents: .date)
        }
        
//        .onChange(of: concert.city) { oldValue, newValue in
//            
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//                getCoordinates(for: concert.venue)
//            }
//        }
    }
    

}

#Preview {
    StubDetailsForm(concert: .constant(SampleData.concerts[0]))
}
