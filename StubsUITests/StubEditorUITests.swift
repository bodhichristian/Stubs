//
//  StubEditorUITests.swift
//  StubsUITests
//
//  Created by christian on 4/10/24.
//

import XCTest

final class StubEditorUITests: XCTestCase {
    
    var app: XCUIApplication!
    var pageObject: StubEditorPageObject!
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
        pageObject = StubEditorPageObject(app: app)
        tapAddConcertButton()
        
        continueAfterFailure = true
    }
    
    override func tearDownWithError() throws {
        app = nil
        pageObject = nil
    }
    
    func testCancelButtonDismissesStubEditor() {
        pageObject.cancelButton.tap()
        
        XCTAssertFalse(app.staticTexts["Stub Editor"].exists)
    }
    
    func testSaveButtonDisabledByDefault() {
        XCTAssert(!pageObject.saveButton.isEnabled)
    }
    
    func testSaveButtonEnabledWhenFormIsComplete() {
        pageObject.fillFormWithKnownGoodData()
        
        XCTAssert(pageObject.saveButton.isEnabled)
    }
    
    func testSaveSuccessDismissesSheet() {
        let addConcertButton = app.navigationBars.staticTexts["AddConcertButton"]
        XCTAssertFalse(addConcertButton.isHittable)
        
        pageObject.fillFormWithKnownGoodData()
        pageObject.saveButton.tap()
        
        delayedAssert(expectation: "Data Fetch Successful") {
            XCTAssert(addConcertButton.isHittable)
        }
    }
    
    func testSaveFailureDoesNotDismissSheet() {
        let addConcertButton = app.navigationBars.staticTexts["AddConcertButton"]
        
        pageObject.fillFormWithEmptyValues()
        pageObject.saveButton.tap()
        
        delayedAssert(expectation: "Fail to Fetch Artist data") {
            XCTAssert(pageObject.stubEditorNavBar.exists)
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
    
    func delayedAssert(expectation: String, waitTime: TimeInterval = 2.0, assertion: () -> Void) {
        let expectation = XCTestExpectation(description: expectation)
        let timer = Timer.scheduledTimer(withTimeInterval: waitTime, repeats: false) { _ in
                    expectation.fulfill()
                }
        
        wait(for: [expectation], timeout: 4.0)
        
        assertion()
        timer.invalidate()
    }
}

