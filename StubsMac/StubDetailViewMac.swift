//
//  StubDetailViewMac.swift
//  StubsMac
//
//  Created by christian on 7/2/24.
//

import SwiftUI

struct StubDetailViewMac: View {
    @Bindable var concert: Concert
    @State private var isEditing = false
    
    var body: some View {
        VStack(spacing: 20) {
            StubBaseNew(concert: concert)
            
            
            
            Text(concert.notes)
                .frame(width: 500)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    StubDetailViewMac(concert: Concert())
}
