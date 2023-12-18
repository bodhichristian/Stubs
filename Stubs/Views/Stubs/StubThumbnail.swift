//
//  StubThumbnail.swift
//  Stubs
//
//  Created by christian on 12/17/23.
//

import SwiftUI

struct StubThumbnail: View {
    let concert: Concert
    
    var body: some View {
        ZStack {
            
            StubShape()
                .foregroundStyle(Color(colorName: concert.accentColor)!)
            
            HStack {
                VerticalLineBoundary()
                
                Spacer()
                
                Image(systemName: concert.iconName)
                    .resizable()
                    .foregroundStyle(.white)
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                
                Spacer()
                
                VerticalLineBoundary()
            }
            .frame(maxWidth: 50)
        }
        .shadow(color: .black.opacity(0.3), radius: 3, y: 2)

        .rotationEffect(Angle(degrees: -15))

        .frame(width: 66, height: 40)
        .padding(.trailing)
    }
}

#Preview {
    StubThumbnail(concert: SampleData.concerts[0])
}
