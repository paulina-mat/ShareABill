//
//  share_a_billUITests.swift
//  share a billUITests
//
//  Created by Paulina Matysiak on 24/03/2019.
//  Copyright © 2019 Paulina Matysiak. All rights reserved.
//

import XCTest

class share_a_billUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUp() {
 
        continueAfterFailure = false
        app.launch()
    }

    override func tearDown() {
    }

    func testAddNewItemCellExists() {
       XCTAssertTrue(app.staticTexts["addNewLabel"].exists)
    }
}
