//
//  StubBaseLayer.swift
//  StubsMac
//
//  Created by christian on 7/9/24.
//

import SwiftUI

struct StubBaseLayer: View {
    let concert: Concert
    
    var body: some View {
        if let imageData = concert.artist?.artistImageData {
            ZStack {
                Group {
                    Image(nsImage: NSImage(data: imageData)!)
                        .resizable()
                        .scaledToFill()
                    
                    LinearGradient(
                        colors: [
                            .black.opacity(0.0),
                            .black.opacity(0.0),
                            .black
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                }
                .frame(width: 500, height: 400)
                .clipShape(StubShape())
            }
        } else {
            StubShape()
                .frame(width: 500, height: 400)
                .padding()
                .foregroundStyle(Color(colorName: concert.accentColor)!)
        }
    }
}

#Preview {
    StubBaseLayer(concert: Concert())
}
