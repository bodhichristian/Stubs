//
//  ArtistMenuLabel.swift
//  Stubs
//
//  Created by christian on 3/2/24.
//

import SwiftUI

struct ArtistMenuLabel: View {
    @Binding var artistImageWidth: CGFloat
    @Binding var listView: Bool
    @Binding var sortOrder: SortOrder
    
    @Environment(\.colorScheme) var colorScheme
    
    private var colors: [Color] {
        switch colorScheme{
        case .light:
            return [.white, .white, .white, .black.opacity(0.7)]
        default:
            return [.white, .black, .black]
        }
    }
    
    var body: some View {
        Menu {
            Button {
                withAnimation(.snappy(duration: 0.5)) {
                    listView.toggle()
                    setImageWidth()
                    
                }
            } label: {
                Label(
                    listView
                    ? "Switch to Grid View"
                    : "Switch to List View",
                    systemImage: listView
                    ? "square.grid.2x2"
                    : "list.bullet"
                )
            }
            
            Section {
                Button {
                    withAnimation(.snappy){
                        sortOrder = .byNameAscending
                    }
                } label: {
                    Label(
                        "Sort by Name A-Z",
                        systemImage: "a.square"
                    )
                }
                
                Button {
                    withAnimation(.snappy){
                        sortOrder = .byNameDescending
                    }
                } label: {
                    Label(
                        "Sort by Name Z-A",
                        systemImage: "z.square"
                    )
                }
            }
        } label: {
            ZStack {
                
                HStack {
                    Text("View Options")
                      
                    Image(systemName: listView
                          ? "line.3.horizontal.circle"
                          : "circle.grid.3x3.circle"
                    )
                    .symbolRenderingMode(.hierarchical)
                }
                .font(.caption)
                .padding(.vertical, 5)
                .padding(.horizontal, 15)
                .frame(height: 36)
                .background {
                    Capsule()
                        .foregroundStyle(
                            LinearGradient(colors: [.purple, .yellow, .green], startPoint: .leading, endPoint: .trailing).opacity(0.3)
                        )
                        .shadow(color: .primary.opacity(0.5),radius: 2)

                    Capsule()
                        .foregroundStyle(.ultraThinMaterial)
                    
                }
                
            }
        }
    }
    
    private func setImageWidth() {
        if artistImageWidth == 44 {
            artistImageWidth = 75
        } else {
            artistImageWidth = 44
        }
    }
}
