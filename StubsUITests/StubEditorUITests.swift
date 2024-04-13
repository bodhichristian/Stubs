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
        pageObject.fillFormWithKnownGoodData()
        pageObject.saveButton.tap()
        
        let expectation = XCTestExpectation(description: "Save async function complete")
        let timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { _ in
                    expectation.fulfill()
                }
        wait(for: [expectation], timeout: 4.0)
        XCTAssertFalse(pageObject.stubEditorNavBar.exists)
        
        timer.invalidate()
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

