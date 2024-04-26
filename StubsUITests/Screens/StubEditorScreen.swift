//
//  StubEditorPageObject.swift
//  StubsUITests
//
//  Created by christian on 4/12/24.
//

import Foundation
import XCTest

class StubEditorScreen: Screen {
    // Conform to Screen protocol
    var app: XCUIApplication
    
    // Screen-specific elements
    let stubEditorNavBar: XCUIElement
    let saveButton: XCUIElement
    let cancelButton: XCUIElement
    let textFieldArtist: XCUIElement
    let textFieldVenue: XCUIElement 
    let textFieldCity: XCUIElement
    let textFieldNotes: XCUIElement

    init(app: XCUIApplication) {
        self.app = app
        
        stubEditorNavBar = app.navigationBars["Stub Editor"]
        saveButton = stubEditorNavBar.buttons["Save"]
        cancelButton = stubEditorNavBar.buttons["Cancel"]

        let views = app.collectionViews
        textFieldArtist = views.textFields["Artist"]
        textFieldVenue = views.textFields["Venue"]
        textFieldCity = views.textFields["City"]
        textFieldNotes = views.textFields["Notes"]
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
        app.clearTextOnElement(textFieldArtist)
        app.clearTextOnElement(textFieldVenue)
        app.clearTextOnElement(textFieldCity)
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
