//
//  NoConcertsView.swift
//  Stubs
//
//  Created by christian on 12/14/23.
//

import SwiftUI

struct NoStubsView: View {
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(systemName: "music.mic")
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .foregroundStyle(.secondary)
            
            Text("No saved concerts.")
                .font(.title2)
                .bold()
            
            Spacer()
        }
        .padding(.bottom, 50)
    }
}
