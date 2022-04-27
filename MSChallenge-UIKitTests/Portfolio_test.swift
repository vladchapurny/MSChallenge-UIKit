//
//  Portfolio_test.swift
//  MSChallenge-UIKitTests
//
//  Created by Vlad Chapurny on 2022-04-27.
//

import XCTest
@testable import MSChallenge_UIKit

class Portfolio_test: XCTestCase {

    var portfolio: Portfolio!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        portfolio = Portfolio()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    //Basic test for init
    func test_init() throws {
        XCTAssertNotNil(portfolio)
        XCTAssertNotNil(portfolio.firstName)
        XCTAssertNotNil(portfolio.email)
        XCTAssertNotNil(portfolio.password)
        XCTAssertNotNil(portfolio.website)
    }
    
    //Basic test checking initialization of struct variables
    func test_var_init() throws {
        XCTAssertEqual(portfolio.firstName, "")
        XCTAssertEqual(portfolio.email, "")
        XCTAssertEqual(portfolio.password, "")
        XCTAssertEqual(portfolio.website, "")
    }
    
    //Basic test for assigning varibles
    func test_var_assignment() throws {
        
        portfolio.firstName = "a"
        portfolio.email = "b"
        portfolio.password = "c"
        portfolio.website = "d"
        
        XCTAssertEqual(portfolio.firstName, "a")
        XCTAssertEqual(portfolio.email, "b")
        XCTAssertEqual(portfolio.password, "c")
        XCTAssertEqual(portfolio.website, "d")
    }
    //Add more test cases!
}
