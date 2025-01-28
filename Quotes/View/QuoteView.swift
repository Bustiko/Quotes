//
//  QuoteView.swift
//  Quotes
//
//  Created by Buse Karabıyık on 17.04.2024.
//

import UIKit

class QuoteView: UIView {
    
    private let uiFunctions = UIFunctions()
    private var quoteText: String
    private var authorName: String
    internal var quoteLabel: UILabel!
    internal var authorLabel: UILabel!
    
    
    init(quote: String, author: String) {
        quoteText = quote
        authorName = author
        super.init(frame: .zero)
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func setupView() {
        quoteLabel = uiFunctions.makeLabel(withText: quoteText, size: 25, font: "Papyrus")
        authorLabel = uiFunctions.makeLabel(withText: authorName, size: 20, font: "Hiragino Sans-W3")
    
        quoteLabel.textColor = UIColor(red: 0.95, green: 0.97, blue: 0.91, alpha: 1.00)
        authorLabel.textColor = UIColor(red: 0.95, green: 0.97, blue: 0.91, alpha: 1.00)
        addSubview(quoteLabel)
        addSubview(authorLabel)

        
        NSLayoutConstraint.activate([
            quoteLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            quoteLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            quoteLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            authorLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            authorLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
    
    
}
