//
//  ProfileCreationViewController_test.swift
//  MSChallenge-UIKitUITests
//
//  Created by Vlad Chapurny on 2022-04-27.
//

import XCTest

class ProfileCreationViewController_test: XCTestCase {

    let app: XCUIApplication = XCUIApplication()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    //Basic test that content exists
    func test_content_exists() throws {
 
        let header = app.staticTexts["Profile Creation"]
        let subheading = app.textViews.staticTexts["Use the form below to submit your portfolio."]
        let subheading2 = app.textViews.staticTexts["An email and password are required."]
        let submitButton = app.buttons["Submit"]
        
        XCTAssertTrue(header.exists)
        XCTAssertTrue(subheading.exists)
        XCTAssertTrue(subheading2.exists)
        XCTAssertTrue(submitButton.exists)
    }
    
    //Basic test that title of page is correct
    func test_title() throws {
        
        let header = app.staticTexts["Profile Creation"]
        XCTAssertEqual(header.label, "Profile Creation")
    }
    
    //Basic test that button is on the page with the correct label
    func test_submit_button() throws {
        
        let submitButton = app.buttons["Submit"]
        XCTAssertEqual(submitButton.label, "Submit")
    }
    
    //Built in test case to test performance
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    //Add more test cases!
}
