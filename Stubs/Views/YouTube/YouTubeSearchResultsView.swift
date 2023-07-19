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
                            VideoLabel(video: video, geo: geo)
                        }
                    }
                }
                .buttonStyle(PlainButtonStyle())
            }
            .sheet(isPresented: $showingSafariView) {
                SafariView(url: URL(string: selectedVideoURL ?? defaultURL)!)
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
        selectedVideoURL = "https://www.youtube.com/watch?v=\(video.videoId)"
        showingSafariView = true
    }
    
}

#Preview {
    YouTubeSearchResultsView(concert: SampleData.concerts[0])
}
