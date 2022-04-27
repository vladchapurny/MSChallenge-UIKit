//
//  CustomTextField_test.swift
//  MSChallenge-UIKitTests
//
//  Created by Vlad Chapurny on 2022-04-27.
//

import XCTest
@testable import MSChallenge_UIKit

class CustomTextField_test: XCTestCase {

    var portfolio: Portfolio!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        portfolio = Portfolio()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    /// Test if checkIfEmpty Function works
    func test_checkIfEmpty() throws {
        
        let textField1 = CustomTextField(title: "1")
        let textField2 = CustomTextField(title: "2")
        
        XCTAssertEqual(textField1.layer.borderColor, UIColor.systemGray5.cgColor)
        XCTAssertEqual(textField2.layer.borderColor, UIColor.systemGray5.cgColor)
        
        textField1.checkIfEmpty()
        textField2.checkIfEmpty()
        XCTAssertEqual(textField1.layer.borderColor, UIColor.systemRed.cgColor)
        XCTAssertEqual(textField1.layer.borderColor, UIColor.systemRed.cgColor)
        
        textField1.text = "a"
        textField2.text = "b"
        textField1.checkIfEmpty()
        textField2.checkIfEmpty()
        XCTAssertEqual(textField1.layer.borderColor, UIColor.systemGray5.cgColor)
        XCTAssertEqual(textField2.layer.borderColor, UIColor.systemGray5.cgColor)
    }
    
    // TODO: Test inits and edge cases!
}
