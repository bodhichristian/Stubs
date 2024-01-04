//
//  AlbumSearchService.swift
//  Stubs
//
//  Created by christian on 12/11/23.
//

import Foundation

@Observable class AlbumSearchService {
    
    var albums: [Album] = []
    
    func searchAlbums(for artist: String) {
        let headers = [
            "X-RapidAPI-Key": rapidAPIKey,
            "X-RapidAPI-Host": "theaudiodb.p.rapidapi.com"
        ]

        let urlString = "https://theaudiodb.p.rapidapi.com/searchalbum.php?s=\(artist.replacingOccurrences(of: " ", with: "_"))"
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
                
                let albumSearchResponse = try JSONDecoder().decode(AlbumSearchResponse.self, from: data)
                    self?.albums = albumSearchResponse.album
                print(albumSearchResponse.album)
            } catch {
                print(error)
            }
        }

        dataTask.resume()
    }
}
