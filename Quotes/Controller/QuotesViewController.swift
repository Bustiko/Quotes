//
//  QuotesViewController.swift
//  Quotes
//
//  Created by Buse Karabıyık on 31.03.2024.
//
import UIKit

class QuotesViewController: UIViewController {
    
    private let uiFunctions = QuotesUIFunctions()
    private let mainUIFunctions = UIFunctions()
    private var category: String?
    private var quoteManager: QuoteManagerProtocol
    private var currentQuote: QuoteModel? = nil
    
    init(category: String, quoteManager: QuoteManagerProtocol = QuoteManager(url: "https://api.api-ninjas.com/v1/quotes?category=")) {
        self.quoteManager = quoteManager
        self.category = category
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor(red: 0.95, green: 0.97, blue: 0.91, alpha: 1.00)
        performTask()
    }
    
    func performTask() {
        Task {
            if let quote = await getQuote() {
                print("Quote: \(quote.quote) by \(quote.author) about \"\(quote.category)\"")
                uiFunctions.setupViews(on: view, quote: quote.quote, author: quote.author, returnSelector: #selector(returnButtonPressed), target: self, quoteSelector: #selector(quoteButtonPressed))
            }
        }
    }
    
    func getQuote() async -> QuoteModel? {
        do {
            if let safeCategory = self.category {
              let quote = try await quoteManager.fetchQuote(category: safeCategory)
              return quote
            }
        }catch {
            print("Failed to fetch quote: \(error)")
        }
        return nil
    }
    
    @objc func quoteButtonPressed() {
        Task {
            if let quote = await getQuote() {
                print("Quote: \(quote.quote) by \(quote.author) about \"\(quote.category)\"")
                DispatchQueue.main.async {
                    for constraint in self.uiFunctions.quoteView.constraints {
                        if constraint.firstAttribute == .height {
                            constraint.isActive = false
                        }
                    }
                    self.uiFunctions.quoteView.authorLabel.text = quote.author
                    self.uiFunctions.quoteView.quoteLabel.text = quote.quote
                    self.uiFunctions.quoteView.heightAnchor.constraint(equalToConstant: self.mainUIFunctions.heightForText(quote.quote, font: UIFont(name: "Papyrus", size: 30)!, width: self.uiFunctions.quoteView.frame.width-20)+100).isActive = true
                }
            }
        }
    }
    
    @objc func returnButtonPressed() {
        self.dismiss(animated: true)
    }

    
}
