//
//  ConcertNotesView.swift
//  Stubs
//
//  Created by christian on 12/24/23.
//

import SwiftUI

struct ConcertNotesView: View {
    let concert: Concert
    
    var body: some View {
        VStack {
            HStack {
                Text("Notes")
                    .font(.title2.bold())
                    .padding(.vertical)
                Spacer()
            }
            
            HStack {
                Text(concert.notes)
                    .padding(.bottom)
                Spacer()
            }
            
            Divider()
                .padding(.bottom)
        }
    }
}

#Preview {
    ConcertNotesView(concert: SampleData.concerts[0])
}
