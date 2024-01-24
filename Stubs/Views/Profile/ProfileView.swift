//
//  ProfileView.swift
//  Stubs
//
//  Created by christian on 1/19/24.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                VStack {
                    
                    // Profile Ticket Stub
                    ZStack{
                        // Base Layer
                        StubShape()
                            .foregroundStyle(.ultraThinMaterial)
                            .shadow(color: .secondary, radius: 5)
                        
                        StubShape()
                            .foregroundStyle(StubStyle.gradientOverlay)
                        
                        
                        // Veritcal Lines
                        HStack {
                            VerticalLineBoundary()
                            
                            Spacer()
                            
                            VerticalLineBoundary()
                        }
                        .frame(width: geo.size.width * 0.75)
                        .padding(.vertical, 30)
                       
                        
                    }
                    .frame(maxHeight: geo.size.height / 3)
                    .padding()
                    
                    Spacer()
                    
                    // LazyVGrid with bento box stats
                }
            }
            .navigationTitle("Profile")
            .toolbar {
                ToolbarItem {
                    Button {
                        // open settings
                    } label: {
                        Label("Settings", systemImage: "gear")
                    }
                }
            }
        }
    }
}
