//
//  MockQuoteManager.swift
//  QuotesTests
//
//  Created by Buse Karabıyık on 23.06.2024.
//

import UIKit
@testable import Quotes

class MockQuoteManager: QuoteManagerProtocol, Mockable {
    func fetchQuote(category: String) async throws -> Quotes.QuoteModel {
        return try loadJSON(filename: "QuoteResponse", type: QuoteData.self)
    }
}
