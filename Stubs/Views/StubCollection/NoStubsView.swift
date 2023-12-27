//
//  NoConcertsView.swift
//  Stubs
//
//  Created by christian on 12/14/23.
//

import SwiftUI

// MARK: NoStubsView(isAddingConcert:)
/*
 - A placeholder view with a call to action.
 - If no concerts are saved, this view is displayed
 and user is presented a call to action.
 - If DEBUG: Option to add sample concert data
 */

struct NoStubsView: View {
    @Environment(\.modelContext) var modelContext
    @Binding var isAddingConcert: Bool
    
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
            
            Text("Tap the + Button to Add a Concert")
            
            Spacer()
#if DEBUG
            Button { // Generate Sample Data
                SampleData().addSampleData(to: modelContext)
                
            } label: {
                Text("Add Sample Data")
            }
#endif
        }
    }
}

#Preview {
    NoStubsView(isAddingConcert: .constant(false))
}
