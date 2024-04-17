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
    
    
    private var textColor: Color {
        if colorScheme == .dark {
            return .black
        } else {
            return .white
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
                        switch sortOrder {
                        case .byNameAscending:
                            sortOrder = .byNameDescending
                        default:
                            sortOrder = .byNameAscending
                        }
                    }
                } label: {
                    Label(
                        sortOrder == .byNameAscending 
                        ? "Sort by Name Z-A"
                        : "Sort by Name A-Z",
                        systemImage: sortOrder == .byNameAscending
                        ? "a.square"
                        : "z.square"
                    )
                }
            }
        } label: {
            ZStack {
                
                HStack {
                    Text("View Options")
                      
                    Spacer()
                    
                    Image(systemName: listView
                          ? "line.3.horizontal.circle"
                          : "circle.grid.3x3.circle"
                    )
                    .symbolRenderingMode(.hierarchical)

                }
                .font(.caption)
                
                .foregroundStyle(textColor)
                .padding(.vertical, 5)
                .padding(.horizontal, 15)
                .frame(width: 132, height: 36)
                .background {

                    Capsule()
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
