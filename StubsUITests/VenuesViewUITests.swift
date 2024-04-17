//
//  VenuesViewUITests.swift
//  StubsUITests
//
//  Created by christian on 4/12/24.
//

import XCTest

final class VenuesViewUITests: XCTestCase {

    var app: XCUIApplication!
    var screen: VenuesViewScreen!
    var entryPoint: XCUIElement!
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = false
        
        screen = VenuesViewScreen(app: app)
        entryPoint = app.staticTexts["Venues, tab"]
        entryPoint.tap()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    
    func testSortButtonOpensMenu() {
        XCTAssertFalse(screen.sortAlphaByCityDescendingButton.exists)
        screen.sortButton.tap()
        XCTAssert(screen.sortAlphaByCityDescendingButton.exists)
    }
    
    
}







