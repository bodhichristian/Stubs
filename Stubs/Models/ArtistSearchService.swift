//
//  ArtistSearchService.swift
//  Stubs
//
//  Created by christian on 12/28/23.
//

import Foundation

class ArtistSearchService: ObservableObject {
    
    @Published var artists: [Artist] = []
    
    func search(for artist: String) {
        let headers = [
            "X-RapidAPI-Key": rapidAPIKey,
            "X-RapidAPI-Host": "theaudiodb.p.rapidapi.com"
        ]
        
        let urlString = "https://theaudiodb.p.rapidapi.com/search.php?s=\(artist.replacingOccurrences(of: " ", with: "_"))"
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { [weak self] (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            
            do {
                
                let artistSearchResponse = try JSONDecoder().decode(ArtistSearchResponse.self, from: data)
                self?.artists = artistSearchResponse.artists
                print(artistSearchResponse.artists)
                
            } catch {
                print(error)
            }
        }
        
        dataTask.resume()
    }
}
