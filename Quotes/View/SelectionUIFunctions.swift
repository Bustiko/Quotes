//
//  SelectionUIFunctions.swift
//  Quotes
//
//  Created by Buse Karabıyık on 2.04.2024.
//

import UIKit

struct SelectionUIFunctions {
    private let uiFunctions = UIFunctions()
    private let categories : Array<String> = ["Age", "Alone", "Amazing", "Anger", "Architecture", "Art", "Attitude", "Beauty", "Best", "Birthday", "Business", "Car", "Change", "Communication", "Computers", "Cool", "Courage", "Dad", "Dating", "Death", "Design", "Dreams", "Education", "Environmental", "Equality", "Experience", "Failure", "Faith", "Family", "Famous", "Fear", "Fitness", "Food", "Forgiveness", "Freedom", "Friendship", "Funny", "Future", "God", "Good", "Government", "Graduation", "Great", "Happiness", "Health", "History", "Home", "Hope", "Humor", "Imagination", "Inspirational", "Intelligence", "Jealousy", "Knowledge", "Leadership", "Learning", "Legal", "Life", "Love", "Marriage", "Medical", "Men", "Mom", "Money", "Morning", "Movies"]
    internal func setupViews(on view: UIView, target: Any?, selector: Selector) {
        let scrollView = CategoryScrollView()
        scrollView.accessibilityIdentifier = "scrollView"
        view.addSubview(scrollView)
        
        for category in categories {
            let button = uiFunctions.makeButton(withText: "\(category)", textSize: 25)
            button.heightAnchor.constraint(equalToConstant: 100).isActive = true
            button.addTarget(target, action: selector, for: .touchUpInside)
            GlobalVariables.stackView.addArrangedSubview(button)
        }
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
