//
//  YouTubeSearchResultsView.swift
//  Stubs
//
//  Created by christian on 7/13/23.
//

import SwiftUI
import YouTubeKit

import SwiftUI
import YouTubeKit
import Kingfisher
import SafariServices

struct YouTubeSearchResultsView: View {
    let concert: Concert
    let youtubeModel = YouTubeModel()
    let youtubeURL = "http://www.youtube.com"
    
    var defaultURL: String {
        "https://www.youtube.com/results?search_query=\(concert.artist)"
    }
    
    @State private var videoList: [YTVideo] = []
    @State private var showingSafariView = false
    @State private var selectedVideoURL: String?
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                ScrollView {
                    VStack(alignment: .leading){
                        ForEach(videoList, id: \.id) { video in
                            Button {
                                watchVideo(video: video)
                            } label: {
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
                                        Text(video.title ?? concert.youTubeQuery)
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
                        
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .sheet(isPresented: $showingSafariView) {
                    SafariView(url: URL(string: defaultURL)!)
                }
            }
            .navigationTitle("YouTube Search")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(.hidden)
        }
        .onAppear {
            searchYoutube(for: concert.youTubeQuery)
        }
    }
    
    func searchYoutube(for query: String) {
        let dataParams: [HeadersList.AddQueryInfo.ContentTypes: String] = [.query: query]
        
        SearchResponse.sendRequest(youtubeModel: youtubeModel, data: dataParams) { result, error in
            if let results = result?.results as? [YTVideo] {
                videoList = results
                print(results)
            } else if let error {
                print(error.localizedDescription)
            }
        }
    }
    
    func watchVideo(video: YTVideo) {
        selectedVideoURL = "https://www.youtube.com/watch?v=\(videoList[0].videoId)"
        showingSafariView = true
    }
    
}

#Preview {
    YouTubeSearchResultsView(concert: SampleData.concerts[0])
}
