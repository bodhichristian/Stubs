//
//  TopVenuesView.swift
//  Stubs
//
//  Created by christian on 8/4/24.
//

import SwiftUI

struct TopVenuesView : View {
    let venues: [Venue]
    
    var body: some View {
        VStack {
            Text("Top Venues")
                .font(.title3)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ForEach(Array(venues.enumerated()), id: \.element.id) { index, venue in
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(.gray.gradient)
                        .frame(width: 44)
                    
                    Text("\(index + 1)")
                        .fontWeight(.bold)
                    
                    Text(venue.name)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Group {
                        if let count = venue.concerts?.count {
                            if count > 1 {
                                Text("\(count + 1) Stubs")
                            } else {
                                Text("\(count + 1) Stub")
                            }
                        }
                    }
                        .foregroundStyle(.secondary)
                }
            }
        }
        .padding(.bottom)
    }
}

#Preview {
    TopVenuesView(venues: [Venue]())
}
