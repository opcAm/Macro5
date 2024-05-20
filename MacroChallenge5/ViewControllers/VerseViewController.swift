//
//  VersiculosViewController.swift
//  MacroChallenge5
//
//  Created by Amanda Conde on 14/05/24.
//

import UIKit

class VerseViewController: UIViewController {

    var savedTexts: [(title: String, text: String)] = []
    var scrollView: UIScrollView!
    var stackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Configurando a view
        view.backgroundColor = .white

        // Criando o botão para mostrar a sheet
        let sheetButton = UIButton(type: .system)
        sheetButton.setImage(UIImage(systemName: "plus.app"), for: .normal)
        sheetButton.addTarget(self, action: #selector(showSheet), for: .touchUpInside)
        sheetButton.tintColor = .orangee

        // Adicionando o botão à view
        sheetButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sheetButton)

        // Criando a scroll view
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)

        // Criando a stack view para os cards
        stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)

        // Configurando Auto Layout
        NSLayoutConstraint.activate([
            sheetButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            sheetButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 355),

            scrollView.topAnchor.constraint(equalTo: sheetButton.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    func setButton() {
        
    }

    @objc func showSheet() {
        let sheetViewController = SheetViewController()
        sheetViewController.delegate = self
        sheetViewController.modalPresentationStyle = .pageSheet

        if let sheet = sheetViewController.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
        }

        present(sheetViewController, animated: true, completion: nil)
    }

    func addCard(withTitle title: String, text: String) {
        let cardView = UIView()
        cardView.backgroundColor = .lightGray
        cardView.layer.cornerRadius = 10
        cardView.isUserInteractionEnabled = true
        cardView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showVerseSheet(_:))))

        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        cardView.addSubview(titleLabel)
        cardView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
            cardView.heightAnchor.constraint(equalToConstant: 50)
        ])

        stackView.addArrangedSubview(cardView)
    }

    @objc func showVerseSheet(_ sender: UITapGestureRecognizer) {
        guard let cardView = sender.view else { return }
        guard let index = stackView.arrangedSubviews.firstIndex(of: cardView) else { return }

        let verseSheetViewController = VerseSheetViewController()
        verseSheetViewController.textToDisplay = savedTexts[index].text
        verseSheetViewController.modalPresentationStyle = .pageSheet

        if let sheet = verseSheetViewController.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
        }

        present(verseSheetViewController, animated: true, completion: nil)
    }
}

extension VerseViewController: SheetViewControllerDelegate {
    func didSubmitText(title: String, text: String) {
        savedTexts.append((title: title, text: text))
        addCard(withTitle: title, text: text)
    }
}

#Preview(){
    VerseViewController()
}
