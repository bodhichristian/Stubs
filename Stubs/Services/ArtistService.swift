//
//  ArtistSearchService.swift
//  Stubs
//
//  Created by christian on 12/28/23.
//

import Foundation

@Observable 
class ArtistService {
    
    var searchResponse: [Artist] = []
    
    
    func search(for artistName: String) async throws -> Artist? {
        
        let headers = [
            "X-RapidAPI-Key": rapidAPIKey,
            "X-RapidAPI-Host": "theaudiodb.p.rapidapi.com"
        ]
        
        let urlStringPrefix = "https://theaudiodb.p.rapidapi.com/search.php?s="
        
        let artistSnakeCase = artistName.replacingOccurrences(of: " ", with: "_")
        
        let urlString = urlStringPrefix + artistSnakeCase
        guard let url = URL(string: urlString) else { return Artist() }
        
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let response = try JSONDecoder().decode(ArtistSearchResponse.self, from: data)
            let artist = response.artists.first
            return artist
        } catch {
            throw error
        }
        
    }
    
    func fetchImageData(
        from urlString: String,
        completion: @escaping (Data?) -> Void
    ) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            completion(data)
        }
        task.resume()
    }
}
