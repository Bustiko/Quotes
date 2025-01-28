//
//  ViewController.swift
//  Quotes
//
//  Created by Buse Karabıyık on 31.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let uiFunctions = MainPageUIFunctions()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.95, green: 0.97, blue: 0.91, alpha: 1.00)
        uiFunctions.setupViews(on: view, target: self, selector: #selector(buttonPressed))
    }
    
    @objc private func buttonPressed(_ sender : UIButton?) {
        let destination = SelectionViewController()
        destination.modalPresentationStyle = .fullScreen
        self.present(destination, animated: true)
    }
    
}


