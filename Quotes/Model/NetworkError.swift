//
//  Error.swift
//  Quotes
//
//  Created by Buse Karabıyık on 19.05.2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
