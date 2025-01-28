//
//  QuoteData.swift
//  Quotes
//
//  Created by Buse Karabıyık on 16.06.2024.
//

import Foundation

struct QuoteData: Decodable {
    let quote: String
    let author: String
    let category: String
}
