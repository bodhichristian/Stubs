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
    let idLabel: String?
    let intLoved: String?
    let intSales: String?
    let intScore: String?
    let intScoreVotes: String?
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
    let strAllMusicID: String?
    let strAmazonID: String?
    let strArtist: String?
    let strArtistStripped: String?
    let strBBCReviewID: String?
    let strDescriptionCN: String?
    let strDescriptionDE: String?
    let strDescriptionEN: String?
    let strDescriptionES: String?
    let strDescriptionFR: String?
    let strDescriptionHU: String?
    let strDescriptionIL: String?
    let strDescriptionIT: String?
    let strDescriptionJP: String?
    let strDescriptionNL: String?
    let strDescriptionNO: String?
    let strDescriptionPL: String?
    let strDescriptionPT: String?
    let strDescriptionRU: String?
    let strDescriptionSE: String?
    let strDiscogsID: String?
    let strGeniusID: String?
    let strGenre: String?
    let strItunesID: String?
    let strLabel: String?
    let strLocation: String?
    let strLocked: String?
    let strLyricWikiID: String?
    let strMood: String?
    let strMusicBrainzArtistID: String?
    let strMusicBrainzID: String?
    let strMusicMozID: String?
    let strRateYourMusicID: String?
    let strReleaseFormat: String?
    let strReview: String?
    let strSpeed: String?
    let strStyle: String?
    let strTheme: String?
    let strWikidataID: String?
    let strWikipediaID: String?
}
