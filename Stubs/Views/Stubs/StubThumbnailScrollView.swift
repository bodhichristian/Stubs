//
//  StubThumbnailScrollView.swift
//  Stubs
//
//  Created by christian on 12/17/23.
//

import SwiftUI

struct StubThumbnailScrollView: View {
    let concerts: [Concert]
    
    var artist: String {
        concerts[0].artist
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0 ) {
            Text("Stubs from \(artist)")
                .font(.title2.bold())

            ScrollView(.horizontal) {
                HStack {
                    ForEach(concerts, id: \.uuid) { concert in
                        VStack(alignment: .leading) {
                            
                            StubThumbnail(concert: concert)
                                .frame(minHeight: 60)
                                .offset(x: 8)
                            
                            Text(concert.city)
                                .font(.headline)
                                .bold()
                            
                            Text(concert.date.formatted(date: .abbreviated, time: .omitted))
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                .padding(.vertical)
            }
        }
    }
}

#Preview {
    StubThumbnailScrollView(concerts: [SampleData.concerts[0]])
}
