//
//  ArtistStubStatView.swift
//  Stubs
//
//  Created by christian on 2/21/24.
//

import SwiftUI

struct ArtistStubStatView: View {
    let count: Int
    let statNameSingular: String
    let statNamePlural: String
    
    var body: some View {
        HStack{
            Text("\(count)")
                .font(.title2)
                .fontDesign(.monospaced)
                .fontWeight(.bold)
            
            Spacer()
            
            if count == 1 {
                Text(statNameSingular)
            } else {
                Text(statNamePlural)
            }
        }
        .padding(.horizontal, 10)
    }
}
