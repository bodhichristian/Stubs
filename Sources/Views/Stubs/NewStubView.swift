//
//  StubView.swift
//  Stubs
//
//  Created by christian on 7/8/23.
//

import SwiftUI

struct NewStubView: View {
    
    let concert: Concert


    var body: some View {
        HStack(spacing: 0) {
            
            // Detail
            ZStack(alignment: .top) {
                Rectangle()
                    .foregroundStyle(.ultraThinMaterial)
                    .background {
                        if let data = concert.artist?.artistImageData {
                            Image(uiImage: UIImage(data: data)!)
                                .resizable()
                                .scaledToFill()
                        }
                    }

                VStack(alignment: .trailing) {
                    Text(concert.artistName)
                        .font(.title2)
                        .lineSpacing(1)
                    
                    Text(concert.venue)
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
                Image(uiImage: UIImage(data: imageData)!)
                    .resizable()
                    .scaledToFill()
            } else {
                Rectangle()
                    .foregroundStyle(Color(colorName: concert.accentColor)!)
            }
            
        }
        .clipShape(StubShape())
        .frame(width: 375, height: 225 )
        .shadow(radius: 10)
    }
}



