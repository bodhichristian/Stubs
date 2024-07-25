//
//  Album.swift
//  Stubs
//
//  Created by christian on 3/17/24.
//

import Foundation
import SwiftData

@Model
class Album: Codable {
    enum CodingKeys: String, CodingKey {
        case albumID = "idAlbum"
        case albumName = "strAlbum"
        case albumArtURL = "strAlbumThumb"
        case albumDescription = "strDescriptionEN"
        case releaseYear = "intYearReleased"
    }
    
    var artist: [Artist]?
    
    var albumID: String?
    var albumName: String?
    var albumArtURL: String?
    var albumDescription: String?
    var releaseYear: String?

    // Image data is fetched after initialization
    @Attribute(.externalStorage) var imageData: Data?
    
    init(
        albumID: String? = nil,
        albumName: String? = nil,
        albumArtURL: String? = nil,
        albumDescription: String? = nil,
        releaseYear: String? = nil
    ) {
        self.albumID = albumID
        self.albumName = albumName
        self.albumArtURL = albumArtURL
        self.albumDescription = albumDescription
        self.releaseYear = releaseYear
    }
    
    // MARK: - Codable Conformance
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        albumID = try container.decodeIfPresent(String.self, forKey: .albumID)
        albumName = try container.decodeIfPresent(String.self, forKey: .albumName)
        albumArtURL = try container.decodeIfPresent(String.self, forKey: .albumArtURL)
        albumDescription = try container.decodeIfPresent(String.self, forKey: .albumDescription)
        releaseYear = try container.decodeIfPresent(String.self, forKey: .releaseYear)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(albumID, forKey: .albumID)
        try container.encodeIfPresent(albumName, forKey: .albumName)
        try container.encodeIfPresent(albumArtURL, forKey: .albumArtURL)
        try container.encodeIfPresent(albumDescription, forKey: .albumDescription)
        try container.encodeIfPresent(releaseYear, forKey: .releaseYear)
    }
    
//    // MARK: - Hashable Conformance
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(albumID)
//    }
//    
//    static func ==(lhs: Album, rhs: Album) -> Bool {
//        return lhs.albumID == rhs.albumID
//    }
}


struct AlbumSearchResponse: Codable {
    let album: [Album]
}



//
//let idAlbum: String?
//let idArtist: String?
//let intYearReleased: String?
//let strAlbum: String?
//let strAlbum3DCase: String?
//let strAlbum3DFace: String?
//let strAlbum3DFlat: String?
//let strAlbumCDart: String?
//let strAlbumSpine: String?
//let strAlbumStripped: String?
//let strAlbumThumb: String?
//let strAlbumThumbBack: String?
//let strAlbumThumbHQ: String?
//let strArtist: String?
//let strDescriptionEN: String?
//let strGenre: String?
//let strMood: String?
//let strStyle: String?
