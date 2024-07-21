//
//  StubDetailViewMac.swift
//  StubsMac
//
//  Created by christian on 7/2/24.
//

import SwiftUI
import SwiftData

struct StubDetailViewMac: View {
    @Bindable var concert: Concert
    @State private var isEditing = false
    @Query var concerts: [Concert]
    
    private var concertsByArtist: [Concert] {
        return concerts.filter({ $0.artistName == concert.artistName })
    }
    
    var body: some View {
        VStack(spacing: 20) {
            StubBaseNew(concert: concert)
                .padding(.top, 100)
            
            Text(concert.notes)
                //.frame(width: 500)
                .multilineTextAlignment(.center)
            
            RelatedStubScrollView(selectedConcert: .constant(concert),  concerts: concertsByArtist)
        }
        .frame(maxWidth: 500, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    StubDetailViewMac(concert: Concert())
}
