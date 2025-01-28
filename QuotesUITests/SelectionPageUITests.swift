//
//  SelectionPageUITests.swift
//  QuotesUITests
//
//  Created by Buse Karabıyık on 25.06.2024.
//

import XCTest
@testable import Quotes
final class SelectionPageUITests: XCTestCase {

    var app: XCUIApplication!
    let categories = ["Age", "Alone", "Amazing", "Anger", "Architecture", "Art", "Attitude", "Beauty", "Best", "Birthday", "Business", "Car", "Change", "Communication", "Computers", "Cool", "Courage", "Dad", "Dating", "Death", "Design", "Dreams", "Education", "Environmental", "Equality", "Experience", "Failure", "Faith", "Family", "Famous", "Fear", "Fitness", "Food", "Forgiveness", "Freedom", "Friendship", "Funny", "Future", "God", "Good", "Government", "Graduation", "Great", "Happiness", "Health", "History", "Home", "Hope", "Humor", "Imagination", "Inspirational", "Intelligence", "Jealousy", "Knowledge", "Leadership", "Learning", "Legal", "Life", "Love", "Marriage", "Medical", "Men", "Mom", "Money", "Morning", "Movies"]
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testSelectionViewController_WhenViewIsLoaded_CategoryButtonsAreEnabled() {
        app.buttons["See Categories"].tap()
        for category in categories{
            XCTAssertTrue(app.buttons["\(category)"].isEnabled, "\(category) button is not enabled.")
        }

    }
    
    func testSelectionViewController_WhenViewIsLoaded_ScrollWorksProperly() {
        app.buttons["See Categories"].tap()
        let scrollview = app.scrollViews["scrollView"]
        scrollview.swipeUp()
        XCTAssertTrue(scrollview.exists, "Scrollview is not working properly.")
        
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
