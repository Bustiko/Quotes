//
//  UIFunctions.swift
//  Quotes
//
//  Created by Buse Karabıyık on 31.03.2024.
//

import UIKit

struct UIFunctions {
    
    internal func makeLabel(withText text : String, size : CGFloat, font : String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = text
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: font, size: size)
        
        
        return label
    }
    
    internal func makeStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
                
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }
    
    internal func makeButton(withText text : String, textSize : CGFloat) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        var config = UIButton.Configuration.filled()
        var attributeContainer = AttributeContainer()
        
        attributeContainer.font = UIFont(name: "Noteworthy-Bold", size: textSize)
        
        config.cornerStyle = .capsule
        config.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
        config.attributedTitle = AttributedString(text, attributes: attributeContainer)
        config.baseBackgroundColor = UIColor(red: 0.13, green: 0.61, blue: 0.56, alpha: 1.00)
        config.baseForegroundColor = UIColor(red: 0.95, green: 0.97, blue: 0.91, alpha: 1.00)
        
        button.configuration = config
        
        return button
        
    
    }
    
    internal func heightForText(_ text: String, font: UIFont, width: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = text.boundingRect(with: constraintRect,
                                            options: .usesLineFragmentOrigin,
                                            attributes: [.font: font],
                                            context: nil)
        return ceil(boundingBox.height)
    }
    

    
}
