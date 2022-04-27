//
//  ProfileCreationViewController_test.swift
//  MSChallenge-UIKitUITests
//
//  Created by Vlad Chapurny on 2022-04-27.
//

import XCTest
import MSChallenge_UIKit

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

    ///Basic test that content exists
    func test_content_exists() throws {
 
        let header = app.staticTexts["Profile Creation"]
        let subheading = app.textViews.staticTexts["Use the form below to submit your portfolio."]
        let subheading2 = app.textViews.staticTexts["An email and password are required."]
        let firstName = app.textFields["First Name"]
        let email = app.textFields["Email Address"]
        let password = app.secureTextFields["Password"]
        let website = app.textFields["Website"]
        let submitButton = app.buttons["Submit"]
                
        XCTAssertTrue(header.exists)
        XCTAssertTrue(subheading.exists)
        XCTAssertTrue(subheading2.exists)
        XCTAssertTrue(firstName.exists)
        XCTAssertTrue(email.exists)
        XCTAssertTrue(password.exists)
        XCTAssertTrue(website.exists)
        XCTAssertTrue(submitButton.exists)
    }
    
    ///Basic test that title of page is correct
    func test_title() throws {
        
        let header = app.staticTexts["Profile Creation"]
        XCTAssertEqual(header.label, "Profile Creation")
    }
    
    ///Basic test that button is on the page with the correct label
    func test_submit_button() throws {
        
        let submitButton = app.buttons["Submit"]
        XCTAssertEqual(submitButton.label, "Submit")
    }
    
    ///Basic test that tests firstName text Field
    func test_firstName_textField() throws {
        let firstName = app.textFields["First Name"]
        let originalValue = firstName.value
        
        firstName.tap()
        firstName.typeText("a")
        XCTAssertEqual(firstName.value as? String, "a")
        firstName.buttons["Clear text"].tap()
        XCTAssertEqual(firstName.value as? String, originalValue as? String)
    }
    
    ///Basic test that tests email text Field
    func test_email_textField() throws {
        let email = app.textFields["Email Address"]
        let originalValue = email.value
        email.tap()
        email.typeText("a")
        XCTAssertEqual(email.value as? String, "a")
        email.buttons["Clear text"].tap()
        XCTAssertEqual(email.value as? String, originalValue as? String)
    }
    
    ///Basic test that tests email text Field
    func test_website_textField() throws {
        let website = app.textFields["Website"]
        let originalValue = website.value
        
        website.tap()
        website.typeText("a")
        XCTAssertEqual(website.value as? String, "a")
        website.buttons["Clear text"].tap()
        XCTAssertEqual(website.value as? String, originalValue as? String)
    }
    
    // TODO: Test inits and edge cases - and more actions!
}
