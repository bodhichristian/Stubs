//
//  StubEditorPageObject.swift
//  StubsUITests
//
//  Created by christian on 4/12/24.
//

import Foundation
import XCTest

class StubEditorPageObject {
    let app: XCUIApplication
    let stubEditorNavBar: XCUIElement
    let saveButton: XCUIElement
    let cancelButton: XCUIElement
    let textFieldArtist: XCUIElement
    let textFieldVenue: XCUIElement
    let textFieldCity: XCUIElement

    init(app: XCUIApplication) {
        self.app = app
        
        stubEditorNavBar = app.navigationBars["Stub Editor"]
        saveButton = stubEditorNavBar.buttons["Save"]
        cancelButton = stubEditorNavBar.buttons["Cancel"]

        let collectionViewsQuery = app.collectionViews
        textFieldArtist = collectionViewsQuery.textFields["Artist"]
        textFieldVenue = collectionViewsQuery.textFields["Venue"]
        textFieldCity = collectionViewsQuery.textFields["City"]
    }

    func fillOutForm(artist: String, venue: String, city: String) {
        textFieldArtist.tap()
        textFieldArtist.typeText(artist)
        textFieldVenue.tap()
        textFieldVenue.typeText(venue)
        textFieldCity.tap()
        textFieldCity.typeText(city)
    }
    
    func clearForm() {
        textFieldArtist.typeText("")
        textFieldVenue.typeText("")
        textFieldCity.typeText("")
    }
    
    func fillFormWithKnownGoodData() {
        fillOutForm(
            artist: "Green Day",
            venue: "Madison Square Garden",
            city: "New York"
        )
    }
    
    func fillFormWithEmptyValues() {
        fillOutForm(artist: " ", venue: " ", city: " ")
    }
}
