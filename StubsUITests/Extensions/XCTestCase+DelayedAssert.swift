//
//  XCTest-Extensions.swift
//  StubsUITests
//
//  Created by christian on 4/16/24.
//

import Foundation
import XCTest

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
