//
//  Artist.swift
//  Stubs
//
//  Created by christian on 1/6/24.
//

import Foundation

struct Artist: Codable {
    let idArtist: String?
    let idLabel: String?
    let intBornYear: String?
    let intCharted: String?
    let intDiedYear: String?
    let intFormedYear: String?
    let intMembers: String?
    let strArtist: String?
    let strArtistAlternate: String?
    let strArtistBanner: String?
    let strArtistClearart: String?
    let strArtistFanart: String?
    let strArtistFanart2: String?
    let strArtistFanart3: String?
    let strArtistLogo: String?
    let strArtistStripped: String?
    let strArtistThumb: String?
    let strArtistWideThumb: String?
    let strBiographyCN: String?
    let strBiographyDE: String?
    let strBiographyEN: String?
    let strBiographyES: String?
    let strBiographyFR: String?
    let strBiographyHU: String?
    let strBiographyIL: String?
    let strBiographyIT: String?
    let strBiographyJP: String?
    let strBiographyNL: String?
    let strBiographyNO: String?
    let strBiographyPL: String?
    let strBiographyPT: String?
    let strBiographyRU: String?
    let strBiographySE: String?
    let strCountry: String?
    let strCountryCode: String?
    let strDisbanded: String?
    let strFacebook: String?
    let strGender: String?
    let strGenre: String?
    let strLabel: String?
    let strLastFMChart: String?
    let strLocked: String?
    let strMood: String?
    let strMusicBrainzID: String?
    let strStyle: String?
    let strTwitter: String?
    let strWebsite: String?
}

struct ArtistSearchResponse: Codable {
    let artists: [Artist]
}
