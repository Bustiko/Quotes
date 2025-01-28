//
//  MainPageUIFunctions.swift
//  Quotes
//
//  Created by Buse Karabıyık on 23.06.2024.
//

import UIKit

struct MainPageUIFunctions {
    
    private let uiFunctions = UIFunctions()
    
    internal func setupViews(on view: UIView, target: UIViewController, selector: Selector) {
        let header = uiFunctions.makeLabel(withText: "QUOTES", size: 80, font: "Papyrus")
        let button = uiFunctions.makeButton(withText: "See Categories", textSize: 20)
        
        header.textColor = UIColor(red: 0.33, green: 0.68, blue: 0.61, alpha: 1.00)
        view.addSubview(header)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            header.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            header.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -45),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40),
            button.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        button.addTarget(target, action: selector, for: .touchUpInside)
        
    }
}
