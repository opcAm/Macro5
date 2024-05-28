//
//  VerseSheetViewController.swift
//  MacroChallenge5
//
//  Created by Amanda Conde on 20/05/24.
//

import UIKit

class VerseSheetViewController: UIViewController {
    
    var textToDisplay: String?

    private let textView: UITextView = {
        let text = UITextView()
        text.isEditable = false
        text.font = UIFont.systemFont(ofSize: 16)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .pinkk
        setElements()
        
        textView.text = textToDisplay
    }
    
    func setElements() {
        text()
    }
    
    func text() {
        view.addSubview(textView)

        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}

#Preview() {
    MainTabBarController()
}
