//
//  ProfileView.swift
//  Stubs
//
//  Created by christian on 8/1/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        GeometryReader { geo in
            VStack {
                
                // Header and Profile Image
                ZStack {
                    Rectangle()
                        .foregroundStyle(.blue)
                        .frame(maxHeight: geo.size.height / 3 )
                    
                    Circle()
                        .frame(width: geo.size.width / 2)
                        .offset(y: geo.size.height / 8)
                    
                }
                .ignoresSafeArea()
                
                
                // Top Stats
                HStack(spacing: 20)  {
                    Text("25 Concerts")
                    Text("15 Artists")
                    Text("10 Venues")
                }
                .font(.headline)
                .padding(.vertical)
                .padding(.top, 60)
                
                ScrollView {
                
                    // Top Stat View
                    VStack(alignment: .leading) {
                        Text("Top Artists")
                            .font(.title3)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ForEach(1..<4){ i in
                            HStack {
                                Circle()
                                    .frame(width: 44)
                                
                                Text("\(i)")
                                    .fontWeight(.bold)
                                
                                Text(DebugData.artists.randomElement()!)
                                    .frame(maxWidth: .infinity, alignment: .leading)

                                Text("\(i + 4) Stubs")
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    .padding(.bottom)
                    
                    // Top Venues
                    VStack(alignment: .leading) {
                        Text("Top Venues")
                            .font(.title3)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ForEach(1..<4){ i in
                            HStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 44, height: 44)
                                
                                Text("\(i)")
                                    .fontWeight(.bold)
                                
                                Text(DebugData.venues.randomElement()!.name)
                                    .frame(maxWidth: .infinity, alignment: .leading)

                                Text("7 Visits")
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    .padding(.bottom, 80)
                    .ignoresSafeArea()
                }
                .padding()
            }
        }
    }
}

#Preview {
    ProfileView()
}
