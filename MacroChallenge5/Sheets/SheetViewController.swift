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
        textField.placeholder = "Livro e número do versículo"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .placeholderText
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let textTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Versículo"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .placeholderText
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Salvar", for: .normal)
        button.setTitleColor(.orangee, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //============================ VIEW DID LOAD =============================
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .pinkk
        setElements()
    }
    
    func setElements() {
        setTitleN()
        setText()
        submit()
    }
    
    func setTitleN() {
        self.view.addSubview(titleTextField)
        
        NSLayoutConstraint.activate([
            titleTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    func setText() {
        self.view.addSubview(textTextField)
        
        NSLayoutConstraint.activate([
            textTextField.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 20),
            textTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    func submit() {
        self.view.addSubview(submitButton)
        submitButton.addTarget(self, action: #selector(submitText), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            submitButton.topAnchor.constraint(equalTo: textTextField.bottomAnchor, constant: 20),
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc private func submitText() {
        guard let title = titleTextField.text, !title.isEmpty,
              let text = textTextField.text, !text.isEmpty else { return }

        delegate?.didSubmitText(title: title, text: text)
        dismiss(animated: true, completion: nil)
    }
}

