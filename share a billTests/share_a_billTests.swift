//
//  share_a_billTests.swift
//  share a billTests
//
//  Created by Paulina Matysiak on 24/03/2019.
//  Copyright © 2019 Paulina Matysiak. All rights reserved.
//

import XCTest
@testable import share_a_bill

class share_a_billTests: XCTestCase {

    private var monkeyItem: Item!
    
    override func setUp() {
        super.setUp()
        
        monkeyItem = Item(icon: "🙈", quantity: 10, name: "monkey", price: 20.0)
    }

    override func tearDown() {

    }

    func testIconEqualsMonkey() {
        XCTAssertEqual(monkeyItem.icon, "🙈")
    }
    
    func testQuantityEqualsTen() {
        XCTAssertEqual(monkeyItem.quantity, 10)
    }
    
    func testNameEqualsMonkey() {
        XCTAssertEqual(monkeyItem.name, "monkey")
    }
    
    func testPriceEqualTwenty() {
        XCTAssertEqual(monkeyItem.price, 20.0)
    }
    
    func testIconEqualsMonkey2() {
        let isMonkey = (monkeyItem.icon == "🙈")
        
        if isMonkey {
            XCTAssertTrue(isMonkey, "It's a monkey!")
        } else {
            XCTFail("It's not a monkey")
        }
    }

//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
