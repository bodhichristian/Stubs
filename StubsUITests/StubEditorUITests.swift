//
//  StubEditorUITests.swift
//  StubsUITests
//
//  Created by christian on 4/10/24.
//

import XCTest
import SwiftData
@testable import Stubs

final class StubEditorUITests: XCTestCase {
    
    var app: XCUIApplication!
    var screen: StubEditorScreen!
    var parentViewEntryPoint: XCUIElement!
    
    override func setUpWithError() throws {
        // App and Screen Set Up
        app = XCUIApplication()
        app.launch()
        screen = StubEditorScreen(app: app)
        continueAfterFailure = true

        // Navigate to Stub Editor
        parentViewEntryPoint = app.navigationBars["Stubs"].buttons["Add Concert"]
        parentViewEntryPoint.tap()
    }
    
    override func tearDownWithError() throws {
        super.tearDown()
        app = nil
        screen = nil
    }
    
    func testSaveButtonDisabledByDefault() {
        XCTAssertFalse(screen.saveButton.isEnabled)
    }
    
    func testCancelButtonDismissesStubEditor() {
        screen.cancelButton.tap()
        
        XCTAssertFalse(screen.cancelButton.exists)
    }
    
    func testSaveButtonDisabledWhenFormIsIncompleteSingleValueAttempt() {
        screen.fillOutForm(artist: "Artist", venue: "", city: "")
        XCTAssertFalse(screen.saveButton.isEnabled)
        app.clearTextOnElement(screen.textFieldArtist)
        
        screen.fillOutForm(artist: "", venue: "Venue", city: "")
        XCTAssertFalse(screen.saveButton.isEnabled)
        app.clearTextOnElement(screen.textFieldVenue)
        
        screen.fillOutForm(artist: "", venue: "", city: "City")
        XCTAssertFalse(screen.saveButton.isEnabled)
    }
    
    func testSaveButtonDisabledWhenFormIsIncompleteMultiValueAttempt() {
        screen.fillOutForm(artist: "Artist", venue: "Venue", city: "")
        XCTAssertFalse(screen.saveButton.isEnabled)
        app.clearTextOnElement(screen.textFieldArtist)
        app.clearTextOnElement(screen.textFieldVenue)
        
        screen.fillOutForm(artist: "Artist", venue: "", city: "City")
        XCTAssertFalse(screen.saveButton.isEnabled)
        app.clearTextOnElement(screen.textFieldArtist)
        app.clearTextOnElement(screen.textFieldCity)
        
        screen.fillOutForm(artist: "", venue: "Venue", city: "City")
        XCTAssertFalse(screen.saveButton.isEnabled)
    }
    
    func testSaveButtonEnabledWhenFormIsComplete() {
        screen.fillFormWithKnownGoodData()
        
        XCTAssert(screen.saveButton.isEnabled)
    }
    
    func testSaveFailureDoesNotDismissSheet() {
        screen.fillFormWithEmptyValues()
        screen.saveButton.tap()
        
        delayedAssert(expectation: "Fail to Fetch Artist data") {
            XCTAssert(screen.stubEditorNavBar.exists)
        }
    }

    func testSaveSuccessDismissesSheet() {
        XCTAssertFalse(parentViewEntryPoint.isHittable)
        
        screen.fillFormWithKnownGoodData()
        screen.saveButton.tap()
        
        delayedAssert(expectation: "Data Fetch Successful") {
            XCTAssert(parentViewEntryPoint.isHittable)
        }
    }
    
    func testSaveSuccessCreatesConcertObjectInParentView() {
        let artist = "Adele"
        let venue = "Barclays"
        let city = "Brooklyn"
                
        screen.fillOutForm(
            artist: artist,
            venue: venue,
            city: city
        )
        screen.saveButton.tap()
        
        delayedAssert(expectation: "\(artist) Artist object has been created") {
            XCTAssert(app.staticTexts["\(artist)"].exists)
        }
    }
}


