//
//  Album.swift
//  Stubs
//
//  Created by christian on 3/17/24.
//

import Foundation

struct AlbumSearchResponse: Codable {
    let album: [Album]
}

struct Album: Codable {
    let idAlbum: String?
    let idArtist: String?
    let intYearReleased: String?
    let strAlbum: String?
    let strAlbum3DCase: String?
    let strAlbum3DFace: String?
    let strAlbum3DFlat: String?
    let strAlbumCDart: String?
    let strAlbumSpine: String?
    let strAlbumStripped: String?
    let strAlbumThumb: String?
    let strAlbumThumbBack: String?
    let strAlbumThumbHQ: String?
    let strArtist: String?
    let strDescriptionEN: String?
    let strGenre: String?
    let strMood: String?
    let strStyle: String?
}
