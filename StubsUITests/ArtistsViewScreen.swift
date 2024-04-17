//
//  ArtistsViewScreen.swift
//  StubsUITests
//
//  Created by christian on 4/17/24.
//

import Foundation
import XCTest

class ArtistsViewScreen {
    let app: XCUIApplication
    let artistsViewNavBar: XCUIElement

    let viewOptionsButton: XCUIElement

    init(app: XCUIApplication) {
        self.app = app
        
        artistsViewNavBar = app.navigationBars["Artists"]

        let views = app.collectionViews
        viewOptionsButton = views.buttons["View Options"]
    }
    
}
