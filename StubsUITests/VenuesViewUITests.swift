//
//  VenuesViewUITests.swift
//  StubsUITests
//
//  Created by christian on 4/12/24.
//

import XCTest

final class VenuesViewUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = false

        tapVenuesTab()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    
    func testVenueViewSortButtonOpensMenu() {
        XCTAssertFalse(app.buttons["Sort by Venue A-Z"].exists)

        tapSortButton()
        
        XCTAssert(app.buttons["Sort by Venue A-Z"].isEnabled)
    }

}

// MARK: Navigation Methods
extension VenuesViewUITests {
    func tapVenuesTab() {
        let venuesTab = app.staticTexts["Venues, tab"]
        venuesTab.tap()
    }
    
    func tapSortButton() {
        let sortButton = app.navigationBars["Venues"].staticTexts["Sort"]
        sortButton.tap()
    }
}






