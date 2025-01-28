//
//  NetworkTests.swift
//  QuotesTests
//
//  Created by Buse Karabıyık on 23.06.2024.
//

import XCTest
@testable import Quotes

final class NetworkTests: XCTestCase {
    
    var quoteManager: MockQuoteManager!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        quoteManager = MockQuoteManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        quoteManager = nil
    }
    
    func testQuoteManager_WhenSuccessfulFetch_ReturnsQuote() async throws {
        //Arrange
        let quotesViewController = await QuotesViewController(category: "testCategory", quoteManager: quoteManager)
        //Act
        let quote = await quotesViewController.getQuote()
        //Assert
        XCTAssertNotNil(quote, "getQuote() method didn't return a quote object.")
    }
    
    func testQuoteManager_WhenInvalidURL_throwsError() {
        let quoteManager = QuoteManager(url: "https://test.com/")
        Task {
            do {
                let _ = try await quoteManager.fetchQuote(category: "Age")
                XCTFail("Expected to throw an error but succeeded")
            } catch {
                XCTAssertEqual(error as? NetworkError, NetworkError.invalidURL)
            }
        }
    }

}
