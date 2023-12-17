//
//  StubPreview.swift
//  Stubs
//
//  Created by christian on 12/17/23.
//

import SwiftUI

struct StubPreview: View {
    let concert: Concert
    
    var body: some View {
            StubView(concert: concert)
                .frame(minHeight: 250)
        
    }
}

#Preview {
    StubPreview(concert: SampleData.concerts[0])
}
