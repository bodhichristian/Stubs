//
//  VideoLabel.swift
//  Stubs
//
//  Created by christian on 7/18/23.
//

import SwiftUI
import YouTubeKit
import Kingfisher

struct VideoLabel: View {
    let video: YTVideo
    let geo: GeometryProxy
    
    var body: some View {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    KFImage(video.thumbnails.first?.url)
                        .scaledToFill()
                        .frame(width: geo.size.width * 0.62,
                               height: geo.size.height * 0.2)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, y: 10)
                        .padding(.trailing)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Image(systemName: "video")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.25,
                                   height: geo.size.height * 0.25)
                            .foregroundStyle(.red)
                        
                            .shadow(radius: 2, y: 2)
                        
                        if let time = video.timeLength {
                            Text(time)
                                .font(.title)
                                .bold()
                                .foregroundStyle(.primary)
                                .offset(y: geo.size.height * -0.07)
                            
                        }
                    }
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Text(video.title ?? "")
                        .font(.title3)
                        .bold()
                        .foregroundStyle(.primary)
                        .padding(.top, 10)
                        .lineLimit(2)
                    
                    HStack {
                        Image(systemName: "rectangle.stack.badge.person.crop")
                            .foregroundStyle(.red)
                        Text(video.channel.name ?? "")
                            .foregroundStyle(.secondary)
                            .lineLimit(2)
                        
                        Spacer()
                        
                        Image(systemName: "chart.bar.xaxis")
                            .foregroundStyle(.red)
                        
                        Text(video.viewCount?.english() ?? "")
                            .foregroundStyle(.primary)
                    }
                    .font(.title3)
                    .fontWeight(.medium)
                    .padding(.top, 8)
                }
                
                Divider()
                    .padding(.vertical)
            }
            .padding(.horizontal)
    }
}

