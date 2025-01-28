//
//  QuotesPageUITests.swift
//  QuotesUITests
//
//  Created by Buse Karabıyık on 25.06.2024.
//

import XCTest
@testable import Quotes
final class QuotesPageUITests: XCTestCase {

    var app: XCUIApplication!
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testQuotesPageViewController_WhenViewIsLoaded_ButtonIsEnabled() throws {
        app.buttons["See Categories"].tap()
        app.buttons["Age"].tap()
        let returnButton = app.buttons["Categories"]
        let quoteButton = app.buttons["Get new quote"]
        XCTAssertTrue(returnButton.isEnabled, "Quotes page return button is not enabled.")
        XCTAssertTrue(quoteButton.isEnabled, "Quotes page new quote button is not enabled.")
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
