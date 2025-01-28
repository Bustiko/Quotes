//
//  MainPageUITests.swift
//  QuotesUITests
//
//  Created by Buse Karabıyık on 25.06.2024.
//

import XCTest
@testable import Quotes
final class MainPageUITests: XCTestCase {

    var app: XCUIApplication!
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
    }

    func testMainPageViewController_WhenViewIsLoaded_ButtonIsEnabled() throws {
        let button = app.buttons["See Categories"]
        XCTAssertTrue(button.isEnabled, "Main page button is not enabled.")
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
