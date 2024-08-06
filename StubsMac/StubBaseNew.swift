//
//  StubBaseNew.swift
//  StubsMac
//
//  Created by christian on 7/9/24.
//

import SwiftUI

struct StubBaseNew: View {
    let concert: Concert
    
    var body: some View {
        HStack(spacing: 0) {
            
            // Detail
            ZStack {
                Rectangle()
                    .foregroundStyle(.ultraThinMaterial)
                    .background {
                        if let data = concert.artist?.artistImageData {
                            Image(nsImage: NSImage(data: data)!)
                                .resizable()
                                .scaledToFill()
                        }
                    }

                VStack(alignment: .trailing) {
                    Text(concert.artistName)
                        .font(.largeTitle)
                        .lineSpacing(1)
                    
                    Text(concert.venueName)
                        .font(.headline)
                    
                    Text(concert.city)
                        .font(.subheadline)
                    
                    Text(concert.date.formatted(date: .numeric, time: .omitted))
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                    
                    
                }
                .multilineTextAlignment(.trailing)
                .frame(maxWidth: .infinity, alignment: .topTrailing)
                .padding()
                
                // Social Circles
                VStack(alignment: .trailing, spacing: 4) {
                    Text("with:")
                        .font(.caption)
                    
                    HStack(spacing: -7) {
                        ForEach(1..<6) { i in
                            Circle()
                                .frame(width: 30, height: 30)
                                .foregroundStyle(Color(colorName: StubStyle.colors[i])!)
                                .shadow(radius: 2)
                                .overlay {
                                    Image(systemName: "person.fill")
                                        .font(.title2)
                                }
                        }
                    }
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                .padding()
                
            }
            
            // Image
            if let imageData = concert.artist?.artistImageData {
                Image(nsImage: NSImage(data: imageData)!)
                    .resizable()
                    .scaledToFill()
            } else {
                Rectangle()
                    .foregroundStyle(Color(colorName: concert.accentColor)!)
            }
            
        }
        .clipShape(StubShape())
        .frame(width: 500, height: 300 )
        .shadow(radius: 10)
    }
}

#Preview {
    StubBaseNew(concert: Concert())
}
