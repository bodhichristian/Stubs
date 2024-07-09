//
//  StubDetailViewMac.swift
//  StubsMac
//
//  Created by christian on 7/2/24.
//

import SwiftUI

struct StubDetailViewMac: View {
    @Bindable var concert: Concert
    
    var body: some View {
        ZStack(alignment: .bottom) {
            StubBaseLayer(concert: concert)
            
            // Footer
            HStack {
                
                // Artist Name, Date
                VStack {
                    Text(concert.artistName)
                        .font(.largeTitle)
                        .fontWeight(.medium)
                    
                    Text(concert.venue)
                        .font(.headline)
                    
                    Text(concert.date.formatted(date: .long, time: .omitted))
                }
                .padding()
            }
            
        }
    }
}

#Preview {
    StubDetailViewMac(concert: Concert())
}
