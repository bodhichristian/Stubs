//
//  ArtistsViewUITests.swift
//  StubsUITests
//
//  Created by christian on 4/11/24.
//

import XCTest

final class ArtistsViewUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = false

        tapArtistsTab()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testViewOptionsButtonOpensMenu() {
        tapViewOptionsButton()
 
        let switchToGridViewButton = app.collectionViews/*@START_MENU_TOKEN@*/.buttons["Switch to Grid View"]/*[[".cells.buttons[\"Switch to Grid View\"]",".buttons[\"Switch to Grid View\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        XCTAssert(switchToGridViewButton.isEnabled)
    }
    
    func testGridViewListViewToggleUpdatesButtonLabel() {
        tapViewOptionsButton()
        
        let switchToGridViewButton = app.collectionViews/*@START_MENU_TOKEN@*/.buttons["Switch to Grid View"]/*[[".cells.buttons[\"Switch to Grid View\"]",".buttons[\"Switch to Grid View\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        switchToGridViewButton.tap()
        tapViewOptionsButton()
        
        XCTAssertFalse(switchToGridViewButton.exists)
    }
    
}

// MARK: Navigation Methods
extension ArtistsViewUITests {
    func tapArtistsTab() {
        let artistsTabStaticText = app.staticTexts["Artists, tab"]
        artistsTabStaticText.tap()
    }
    
    func tapViewOptionsButton() {
        let viewOptionsStaticText = app.navigationBars["Artists"]/*@START_MENU_TOKEN@*/.staticTexts["View Options"]/*[[".otherElements[\"View Options\"]",".buttons[\"View Options\"]",".buttons.staticTexts[\"View Options\"]",".staticTexts[\"View Options\"]"],[[[-1,3],[-1,2],[-1,1,2],[-1,0,1]],[[-1,3],[-1,2],[-1,1,2]],[[-1,3],[-1,2]]],[0]]@END_MENU_TOKEN@*/
        viewOptionsStaticText.tap()
    }
}
