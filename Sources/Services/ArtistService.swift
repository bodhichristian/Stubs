//
//  ArtistSearchService.swift
//  Stubs
//
//  Created by christian on 12/28/23.
//

import Foundation

@Observable
class ArtistService {
    
    var fetchedArtist: Artist?
    var fetchedAlbums: [Album]?
    var fetchFailed = false
    
    let albumService = AlbumService()
    
    func search(for artistName: String) async throws {
        let headers = [
            "X-RapidAPI-Key": rapidAPIKey,
            "X-RapidAPI-Host": "theaudiodb.p.rapidapi.com"
        ]
        
        let urlStringPrefix = "https://theaudiodb.p.rapidapi.com/search.php?s="
        let formattedArtistName = artistName.replacingOccurrences(of: " ", with: "_")
        
        let urlString = urlStringPrefix + formattedArtistName
        
        guard let url = URL(string: urlString) else {
            fetchFailed = true
            throw ArtistServiceError.invalidArtistURL
        }
        
        var request = URLRequest(
            url: url,
            cachePolicy: .useProtocolCachePolicy,
            timeoutInterval: 10.0
        )
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        do { // Search for artist
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoder = JSONDecoder()
            let response = try decoder.decode(ArtistSearchResponse.self, from: data)
            let artist = response.artists.first
            
            self.fetchedArtist = artist
            print(artist?.artistName ?? "Artist" + " retreived.")
        } catch {
            self.fetchFailed = true
            throw ArtistServiceError.failedToFetchArtist
        }
        
        do { // Fetch artist and banner images
            let artistImageData = try await fetchImageData(from: fetchedArtist?.artistImageURL ?? "")
            let bannerImageData = try await fetchImageData(from: fetchedArtist?.bannerImageURL ?? "")
            
            fetchedArtist?.artistImageData = artistImageData
            fetchedArtist?.bannerImageData = bannerImageData
        } catch {
            self.fetchFailed = true
            throw ArtistServiceError.failedToFetchImages
        }
        
//        if let artistID = fetchedArtist?.artistID {
//            do {
//                print("1")
//                
//                
//                try await albumService.searchAlbums(for: artistID)
//                
//                print("2")
//                fetchedArtist!.albums = albumService.albums
//                print("3")
//
//            } catch {
////                throw AlbumSearchError.unknownArtistID
//            }
//        }
        
//        if let albums = fetchedArtist?.albums {
//            for i in 0..<albums.count {
//                do {
//                    let data = try await fetchImageData(from: albums[i].albumArtURL ?? "")
//                    fetchedArtist?.albums?[i].imageData = data
//                } catch {
//                    print("********")
//                }
//            }
//        }
    }
    
    private func fetchImageData(from urlString: String) async throws-> Data? {
        guard let url = URL(string: urlString) else {
            throw ArtistServiceError.invalidImageURL
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return data
        } catch {
            throw ArtistServiceError.failedToFetchImages
        }
    }
}
