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
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
        screen = StubEditorScreen(app: app)
        tapAddConcertButton()
        continueAfterFailure = true
    }
    
    override func tearDownWithError() throws {
        super.tearDown()
        app = nil
        screen = nil
    }
    
    func testCancelButtonDismissesStubEditor() {
        screen.cancelButton.tap()
        
        XCTAssertFalse(app.staticTexts["Stub Editor"].exists)
    }
    
    func testIconsOffScreenHittableAfterSwipe() {
             
    }
    
    func testSaveButtonDisabledByDefault() {
        XCTAssertFalse(screen.saveButton.isEnabled)
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
        let addConcertButton = app.navigationBars.staticTexts["AddConcertButton"]
        XCTAssertFalse(addConcertButton.isHittable)
        
        screen.fillFormWithKnownGoodData()
        screen.saveButton.tap()
        
        delayedAssert(expectation: "Data Fetch Successful") {
            XCTAssert(addConcertButton.isHittable)
        }
    }
}

// MARK: Navigation
extension StubEditorUITests {
    
    func tapAddConcertButton() {
        let stubCollectionNavBar = app.navigationBars["Stubs"]
        let addConcertButton = stubCollectionNavBar.staticTexts["AddConcertButton"]
        addConcertButton.tap()
    }
    
}

extension XCUIApplication {
    func clearTextOnElement(_ element: XCUIElement) {
        element.doubleTap()
        menuItems["Cut"].tap()
    }
}

extension XCTestCase {
    /// Create a delay prior to assertion for testing UI components with asynchronus results.
    /// - Parameters:
    ///   - expectation: A description String for XCTestExpectation(description:).
    ///   - waitTime: The time interval preceding expectation fulfillment.
    ///   - assertion: A closure from which to call your assertion.
    ///
    /// Example call with trailing closure syntax:
    /// ```
    /// delayedAssert(
    ///     expectation: "Fetch data successfully.",
    ///     waitTime: 3.2
    ///     ) {
    ///         XCTAssertFalse(screen.saveButton.exists)
    ///     }
    /// ```
    ///
    func delayedAssert(
        expectation: String,
        waitTime: TimeInterval = 3.0,
        assertion: () -> Void
    ) {
        let expectation = XCTestExpectation(description: expectation)
        let timer = Timer.scheduledTimer(
            withTimeInterval: waitTime,
            repeats: false
        ) { _ in
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: waitTime + 1.0)
        
        assertion()
        timer.invalidate()
    }

}
