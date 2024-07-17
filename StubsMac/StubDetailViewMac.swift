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
        ZStack(alignment: .bottom) {
            StubBaseNew(concert: concert)
            
            
        }
    }
}

#Preview {
    StubDetailViewMac(concert: Concert())
}
