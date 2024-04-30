//
//  ArtistsViewUITests.swift
//  StubsUITests
//
//  Created by christian on 4/11/24.
//

import XCTest

final class ArtistsViewUITests: XCTestCase {

    var app: XCUIApplication!
    var screen: ArtistsViewScreen!
    var entryPoint: XCUIElement!
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = false
        
        screen = ArtistsViewScreen(app: app)
        entryPoint = app.staticTexts["Artists, tab"]
        entryPoint.tap()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testViewOptionsButtonOpensMenu() {
        XCTAssertFalse(screen.switchToGridViewButton.exists)
        screen.viewOptionsButton.tap()
        XCTAssert(screen.switchToGridViewButton.exists)
    }
    
    func testGridViewListViewToggleUpdatesButtonLabel() {
        screen.viewOptionsButton.tap()
        
        XCTAssertFalse(screen.switchToListViewButton.exists)
        screen.switchToGridViewButton.tap()
        
        screen.viewOptionsButton.tap()
        XCTAssertFalse(screen.switchToGridViewButton.exists)
        XCTAssert(screen.switchToListViewButton.exists)
    }
    
    func testAlphabeticalSortToggleUpdatesButtonLabel() {
        screen.viewOptionsButton.tap()
        
        XCTAssertFalse(screen.sortAlphaAscending.exists)
        screen.sortAlphaDescending.tap()
        
        screen.viewOptionsButton.tap()
        XCTAssertFalse(screen.sortAlphaDescending.exists)
        XCTAssert(screen.sortAlphaAscending.exists)
    }
    
    func testTapFirstElementInScrollView() {
        
    }
}





