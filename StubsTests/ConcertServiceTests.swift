//
//  ConcertServiceTests.swift
//  StubsTests
//
//  Created by christian on 3/29/24.
//

import XCTest
@testable import Stubs

final class ConcertServiceTests: XCTestCase {
    
    var sut: ConcertService!

    override func setUp()  {
        sut = ConcertService()
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testConcertServiceInit() {
        XCTAssertNotNil(sut.template)
    }
}



