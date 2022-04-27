//
//  ConfirmationViewController_test.swift
//  MSChallenge-UIKitTests
//
//  Created by Vlad Chapurny on 2022-04-27.
//

import XCTest
@testable import MSChallenge_UIKit

class ConfirmationViewController_test: XCTestCase {

    var portfolio: Portfolio!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        portfolio = Portfolio()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    /// Test if nonEmptyDataInformationStack function Function works
    func test_nonEmptyDataInformationStack_fullData() throws {
        
        portfolio.firstName = "a"
        portfolio.email = "b"
        portfolio.website = "c"
        portfolio.password = "d"
        
        let vc = ConfirmationViewController(portfolio: portfolio)
        vc.nonEmptyDataInformationStack()
        XCTAssertEqual(vc.informationStack.subviews.count, 3)
    }
}
