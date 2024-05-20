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
        let textView = UITextView()
        textView.isEditable = false
        textView.font = UIFont.systemFont(ofSize: 16)
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Configurando a view
        view.backgroundColor = .systemGray6

        // Adicionando o textView à view
        textView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textView)

        // Configurando Auto Layout
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])

        // Configurando o texto do textView
        textView.text = textToDisplay
    }
}
