//
//  ViewControllerUITests.swift
//  QuotesUITests
//
//  Created by Buse Karabıyık on 26.06.2024.
//

import XCTest
@testable import Quotes
final class ViewControllerUITests: XCTestCase {

    var app: XCUIApplication!
    var window: UIWindow!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let sceneDelegate = scene.delegate as? SceneDelegate {
            window = sceneDelegate.window
        }
    }

    override func tearDownWithError() throws {
        app = nil
        window = nil
//        mainPageViewController = ViewController()
//        mainPageViewController.loadViewIfNeeded()
    }

//    func testMainPageViewController_WhenButtonPushed_PresentsCategoriesPage() {
//        app.buttons["See Categories"].tap()
//        if let root = self.window.rootViewController as? Quotes.ViewController {
//            XCTAssertTrue(self.window.rootViewController?.presentedViewController is Quotes.SelectionViewController)
//        }
//        
//    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
