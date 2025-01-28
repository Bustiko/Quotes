//
//  QuotesUIFunctions.swift
//  Quotes
//
//  Created by Buse Karabıyık on 17.04.2024.
//

import UIKit

class QuotesUIFunctions {
    private let uiFunctions = UIFunctions()
    internal var quoteView: QuoteView!
    
    internal func setupViews(on view: UIView, quote: String, author: String, returnSelector : Selector, target : UIViewController, quoteSelector: Selector) {
        
        quoteView = QuoteView(quote: quote, author: author)
        let returnButton = uiFunctions.makeButton(withText: "Categories", textSize: 20)
        let nextQuoteButton = uiFunctions.makeButton(withText: "Get new quote", textSize: 20)
        
        quoteView.translatesAutoresizingMaskIntoConstraints = false
        quoteView.backgroundColor = UIColor(red: 0.58, green: 0.82, blue: 0.70, alpha: 1.00)
        quoteView.layer.cornerRadius = 20
        
        returnButton.addTarget(target, action: returnSelector, for: .touchUpInside)
        nextQuoteButton.addTarget(target, action: quoteSelector, for: .touchUpInside)
        
        view.addSubview(quoteView)
        view.addSubview(returnButton)
        view.addSubview(nextQuoteButton)
        
        NSLayoutConstraint.activate([
            quoteView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            quoteView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            quoteView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20),
            quoteView.heightAnchor.constraint(equalToConstant: uiFunctions.heightForText(quoteView.quoteLabel.text!, font: UIFont(name: "Papyrus", size: 30)!, width: view.frame.width-20)+100),
            returnButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            returnButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            returnButton.widthAnchor.constraint(equalToConstant: 150),
            returnButton.heightAnchor.constraint(equalToConstant: 35),
            nextQuoteButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            nextQuoteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextQuoteButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40),
            nextQuoteButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
}
