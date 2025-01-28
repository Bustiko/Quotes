//
//  QuoteManager.swift
//  Quotes
//
//  Created by Buse Karabıyık on 12.05.2024.
//

import Foundation

protocol QuoteManagerProtocol {
    func fetchQuote(category: String) async throws -> QuoteModel
}

struct QuoteManager: QuoteManagerProtocol {
    private var url: String
    
    init(url: String) {
        self.url = url
    }
    
    func fetchQuote(category: String) async throws -> QuoteModel {
        let category = "\(category)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            guard let url = URL(string: url + (category ?? "")) else {
                throw NetworkError.invalidURL
            }

            var request = URLRequest(url: url)
            let apiKey = ProcessInfo.processInfo.environment["API_KEY"]
            request.setValue(apiKey, forHTTPHeaderField: "X-Api-Key")

            let (data, response) = try await URLSession.shared.data(for: request)

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw NetworkError.invalidResponse
            }

            do {
                let decodedData = try JSONDecoder().decode([QuoteData].self, from: data)
                return QuoteModel(quote: decodedData[0].quote, author: decodedData[0].author, category: decodedData[0].category)
            } catch {
                throw NetworkError.invalidData
            }
    }
    
    
    
    
    
}
