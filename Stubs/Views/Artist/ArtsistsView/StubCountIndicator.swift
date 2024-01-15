//
//  StubCountIndicator.swift
//  Stubs
//
//  Created by christian on 1/15/24.
//

import SwiftUI

struct StubCountIndicator: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 25)
                .foregroundStyle(.green.opacity(0.6))
            Text("#")
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    StubCountIndicator()
}
