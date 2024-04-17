//
//  VenuesViewScreen.swift
//  StubsUITests
//
//  Created by christian on 4/17/24.
//

import Foundation
import XCTest

class VenuesViewScreen {
    let app: XCUIApplication
    let navBar: XCUIElement
    let sortButton: XCUIElement
    let sortAlphaByVenueAscendingButton: XCUIElement
    let sortAlphaByVenueDescendingButton: XCUIElement
    let sortAlphaByCityAscendingButton: XCUIElement
    let sortAlphaByCityDescendingButton: XCUIElement
    
    init(app: XCUIApplication) {
        self.app = app
        self.navBar = app.navigationBars["Venues"]
        self.sortButton = navBar.buttons["Sort"]
        
        let views = app.collectionViews
        self.sortAlphaByVenueAscendingButton = views.buttons["Sort by Venue A-Z"]
        self.sortAlphaByVenueDescendingButton = views.buttons["Sort by Venue Z-A"]
        self.sortAlphaByCityAscendingButton = views.buttons["Sort by City A-Z"]
        self.sortAlphaByCityDescendingButton = views.buttons["Sort by City Z-A"]
    }
}
