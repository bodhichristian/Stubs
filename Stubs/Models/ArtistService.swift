//
//  ArtistSearchService.swift
//  Stubs
//
//  Created by christian on 12/28/23.
//

import Foundation

@Observable class ArtistService {
    
    var singleArtistSearchResponse: [Artist] = []

    var multiArtistSearchResponse: [Artist] = []
    
    func search(for artistName: String) {
            
        let headers = [
            "X-RapidAPI-Key": rapidAPIKey,
            "X-RapidAPI-Host": "theaudiodb.p.rapidapi.com"
        ]
        
        let urlStringPrefix = "https://theaudiodb.p.rapidapi.com/search.php?s="
        print("here")
        
        
        let artistSnakeCase = artistName.replacingOccurrences(of: " ", with: "_")
        
        let urlString = urlStringPrefix + artistSnakeCase
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
                self?.singleArtistSearchResponse = artistSearchResponse.artists
                
                print("Artist is \(artistSearchResponse.artists.first?.strArtistThumb ?? "")")
                
                
            } catch {
                print(error)
            }
        }
        
        dataTask.resume()
        
    }
    
    
}
