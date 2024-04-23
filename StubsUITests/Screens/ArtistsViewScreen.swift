//
//  ArtistsViewScreen.swift
//  StubsUITests
//
//  Created by christian on 4/17/24.
//

import Foundation
import XCTest

class ArtistsViewScreen: Screen {
    // Conform to Screen protocol
    var app: XCUIApplication
    
    // Screen-specific elements
    let artistsViewNavBar: XCUIElement
    let searchBar: XCUIElement
    let viewOptionsButton: XCUIElement
    let switchToGridViewButton: XCUIElement
    let switchToListViewButton: XCUIElement
    let sortAlphaAscending: XCUIElement
    let sortAlphaDescending: XCUIElement

    init(app: XCUIApplication) {
        self.app = app
        
        artistsViewNavBar = app.navigationBars["Artists"]

        let views = app.collectionViews
        searchBar = views.textFields["Search Artists"]
        viewOptionsButton = artistsViewNavBar.buttons["View Options"]
        switchToGridViewButton = views.buttons["Switch to Grid View"]
        switchToListViewButton = views.buttons["Switch to List View"]
        sortAlphaAscending = views.buttons["Sort by Name A-Z"]
        sortAlphaDescending = views.buttons["Sort by Name Z-A"]
    }
}
