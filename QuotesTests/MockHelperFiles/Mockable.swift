//
//  Mockable.swift
//  QuotesTests
//
//  Created by Buse Karabıyık on 24.06.2024.
//

import Foundation
@testable import Quotes
protocol Mockable: AnyObject {
    var bundle: Bundle { get }
    func loadJSON(filename: String, type: QuoteData.Type) throws -> QuoteModel
}

extension Mockable {
    var bundle: Bundle {
        return Bundle(for: type(of: self))
    }
    
    func loadJSON(filename: String, type: QuoteData.Type) throws -> QuoteModel {
        guard let path = bundle.url(forResource: filename, withExtension: "json") else {
            fatalError("Failed to load JSON file.")
        }
        
        do {
            let data = try Data(contentsOf: path)
            let decodedData = try JSONDecoder().decode([QuoteData].self, from: data)
            return QuoteModel(quote: decodedData[0].quote, author: decodedData[0].author, category: decodedData[0].category)
        } catch {
            throw NetworkError.invalidData
        }
    }
}
