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
        if let imageData = concert.artist?.artistImageData {
            Image(nsImage: NSImage(data: imageData)!)
                .clipShape(StubShape())
        } else {
            StubShape()
                .frame(maxWidth: 500, maxHeight: 300)
                .padding()
            
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    StubDetailViewMac(concert: Concert())
}
