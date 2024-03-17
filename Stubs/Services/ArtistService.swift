//
//  ArtistSearchService.swift
//  Stubs
//
//  Created by christian on 12/28/23.
//

import Foundation

@Observable class ArtistService {
    
    var searchResponse: [Artist] = []
    
    func search(for artistName: String) async throws {
            
        let headers = [
            "X-RapidAPI-Key": rapidAPIKey,
            "X-RapidAPI-Host": "theaudiodb.p.rapidapi.com"
        ]
        
        let urlStringPrefix = "https://theaudiodb.p.rapidapi.com/search.php?s="        
        
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
                let response = try JSONDecoder().decode(ArtistSearchResponse.self, from: data)
                self?.searchResponse = response.artists
                
                print("Artist is \(response.artists.first?.artistName ?? "")")
            } catch {
                print(error)
            }
        }
        
        dataTask.resume()
    }
    
    
    func debugSearch(for artistName: String) async throws -> Artist? {
        
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
}
