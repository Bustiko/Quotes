//
//  SelectionViewController.swift
//  Quotes
//
//  Created by Buse Karabıyık on 23.06.2024.
//

import UIKit

class SelectionViewController: UIViewController {
    private let uiFunctions = SelectionUIFunctions()
    private var quoteManager: QuoteManagerProtocol
    
    init(quoteManager: QuoteManagerProtocol = QuoteManager(url: "https://api.api-ninjas.com/v1/quotes?category=")) {
        self.quoteManager = quoteManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.95, green: 0.97, blue: 0.91, alpha: 1.00)
        uiFunctions.setupViews(on: view, target: self, selector: #selector(buttonPressed))
    }
    
    @objc private func buttonPressed(_ sender : UIButton?){
        let category = (sender?.titleLabel?.text)!
        let destination = QuotesViewController(category: category,quoteManager: quoteManager)
        destination.modalPresentationStyle = .fullScreen
        self.present(destination, animated: true)
    }
    
}
