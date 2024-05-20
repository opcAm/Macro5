//
//  SheetViewController.swift
//  MacroChallenge5
//
//  Created by Amanda Conde on 16/05/24.
//

import UIKit

protocol SheetViewControllerDelegate: AnyObject {
    func didSubmitText(title: String, text: String)
}

class SheetViewController: UIViewController {

    weak var delegate: SheetViewControllerDelegate?

    private let titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter title"
        textField.borderStyle = .roundedRect
        return textField
    }()

    private let textTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter text"
        textField.borderStyle = .roundedRect
        return textField
    }()

    private let submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Submit", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Configurando a view
        view.backgroundColor = .systemGray6

        // Adicionando os campos de texto e botão à view
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        textTextField.translatesAutoresizingMaskIntoConstraints = false
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleTextField)
        view.addSubview(textTextField)
        view.addSubview(submitButton)

        // Configurando Auto Layout
        NSLayoutConstraint.activate([
            titleTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            textTextField.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 20),
            textTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            submitButton.topAnchor.constraint(equalTo: textTextField.bottomAnchor, constant: 20),
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        // Associando o método submitText ao botão
        submitButton.addTarget(self, action: #selector(submitText), for: .touchUpInside)
    }

    @objc private func submitText() {
        guard let title = titleTextField.text, !title.isEmpty,
              let text = textTextField.text, !text.isEmpty else { return }

        delegate?.didSubmitText(title: title, text: text)
        dismiss(animated: true, completion: nil)
    }
}

#Preview(){
    MainTabBarController()
}
