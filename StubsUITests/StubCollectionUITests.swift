//
//  StubsUITests.swift
//  StubsUITests
//
//  Created by christian on 4/10/24.
//

import XCTest

final class StubCollectionUITests: XCTestCase {
    
    var app: XCUIApplication!
    var screen: StubCollectionScreen!
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = true
        
        screen = StubCollectionScreen(app: app)
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testAddConcertButtonPresentsStubEditor() throws {
        screen.addConcertButton.tap()
        XCTAssertTrue(app.staticTexts["Stub Editor"].exists)
    }
    
    func testStubEditorCancelButtonDismissesStubEditor() throws {
        screen.addConcertButton.tap()
        
        screen.stubEditorCancelButton.tap()
        XCTAssertFalse(screen.stubEditorCancelButton.exists)
    }
    
    func testSearchFieldFocusCancellable() {
        let cancelButton = screen.navBar.buttons["Cancel"]
        XCTAssertFalse(cancelButton.exists)
        
        screen.searchBar.tap()
        XCTAssertTrue(cancelButton.exists)
        
        cancelButton.tap()
        XCTAssertFalse(cancelButton.exists)
    }
    
    func testAddConcertCreatesListItem() {
        screen.addConcertButton.tap()
        
        let stubEditor = StubEditorScreen(app: app)
        let artist = "Adele"
        let venue = "Barclays"
        let city = "New York"
        stubEditor.fillOutForm(artist: artist, venue: venue, city: city)
        
        stubEditor.saveButton.tap()
        let newConcertListItem = app.scrollViews.staticTexts[artist]

        delayedAssert(
            expectation: "Artist Object Fetched",
            waitTime: 10.0
        ) {

            XCTAssert(newConcertListItem.exists)
        }
    }
}











