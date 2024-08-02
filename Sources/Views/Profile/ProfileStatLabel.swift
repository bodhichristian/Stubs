//
//  ProfileStatLabel.swift
//  Stubs
//
//  Created by christian on 8/1/24.
//

import SwiftUI

struct ProfileStatLabel: View {
    let number: Int
    let label: String
    
    var body: some View {
        VStack {
            Text("\(number)")
                .font(.system(size: 48))
                .fontWeight(.black)
                //.foregroundStyle(.white.gradient)
                //.shadow(color: .black.opacity(0.3), radius: 3)
            Text("\(label)")
                .fontWeight(.semibold)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ProfileStatLabel(number: 2, label: "Artists")
}
