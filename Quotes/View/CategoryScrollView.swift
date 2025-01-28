//
//  CategoryScrollView.swift
//  Quotes
//
//  Created by Buse Karabıyık on 10.04.2024.
//

import UIKit

class CategoryScrollView : UIScrollView {
    
    private let uiFunctions = UIFunctions()
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView() {
        GlobalVariables.stackView = uiFunctions.makeStackView()
        
        addSubview(GlobalVariables.stackView)
        
        NSLayoutConstraint.activate([
            GlobalVariables.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            GlobalVariables.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            GlobalVariables.stackView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -30),
            GlobalVariables.stackView.topAnchor.constraint(equalTo: self.topAnchor),
            GlobalVariables.stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    
}
