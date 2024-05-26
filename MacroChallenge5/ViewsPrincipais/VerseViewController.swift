//
//  VersiculosViewController.swift
//  MacroChallenge5
//
//  Created by Amanda Conde on 14/05/24.
//

import UIKit
import CoreData

class VerseViewController: UIViewController {
    
    var savedTexts: [Verse] = []
    var scrollView: UIScrollView!
    var vstack: UIStackView!
    
    //========================== Mensagem se vazio ===========================
    let messageEmpty1: UILabel = {
        let message = UILabel()
        message.text = "Aqui você pode escrever seus versículos favoritos."
        message.font = .boldSystemFont(ofSize: 32)
        message.textAlignment = .center
        message.numberOfLines = .max
        message.textColor = .pinkk
        message.isHidden = false
        message.translatesAutoresizingMaskIntoConstraints = false
        return message
    }()
    
    let messageEmpty2: UILabel = {
        let message = UILabel()
        message.text = "Clique no + para adicionar seu primeiro versículo"
        message.font = .systemFont(ofSize: 18)
        message.textAlignment = .center
        message.numberOfLines = .max
        message.textColor = .brown
        message.isHidden = false
        message.translatesAutoresizingMaskIntoConstraints = false
        return message
    }()
    
    let titleVerse: UILabel = {
        let title = UILabel()
        title.text = "Versículos"
        title.font = UIFont.boldSystemFont(ofSize: 34)
        title.textColor = .fonte
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let sheetButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus.app"), for: .normal)
        button.tintColor = .orange
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //======================== VIEW DID LOAD ==========================
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setElements()
        view.backgroundColor = .background
        
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        vstack = UIStackView()
        vstack.axis = .vertical
        vstack.spacing = 10
        vstack.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(vstack)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: titleVerse.bottomAnchor, constant: 20),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            vstack.topAnchor.constraint(equalTo: scrollView.topAnchor),
            vstack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            vstack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            vstack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            vstack.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        fetchSavedVerses()
        ifMessage()
    }
    
    //======================== set elements ==========================
    func setElements() {
        setTitle()
        setButton()
        showMessage()
    }
    
    //======================== set title ==========================
    func setTitle() {
        self.view.addSubview(titleVerse)
        
        NSLayoutConstraint.activate([
            titleVerse.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleVerse.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
    
    //======================== set button ==========================
    func setButton() {
        self.view.addSubview(sheetButton)
        sheetButton.addTarget(self, action: #selector(showSheet), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            sheetButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            sheetButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
        ])
    }
    
    func addCard(withTitle title: String, text: String, index: Int) {
        let cardView = UIView()
        cardView.backgroundColor = .pinkk
        cardView.layer.cornerRadius = 20
        cardView.isUserInteractionEnabled = true
        cardView.tag = index

        cardView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showVerseSheet(_:))))
        cardView.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:))))
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 32)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        cardView.addSubview(titleLabel)
        cardView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
            cardView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        vstack.addArrangedSubview(cardView)
    }
    
    @objc func showSheet() {
        let sheetViewController = SheetViewController()
        sheetViewController.delegate = self
        sheetViewController.modalPresentationStyle = .pageSheet
        
        if let sheet = sheetViewController.sheetPresentationController {
            sheet.detents = [.custom(resolver: { context in
                0.3 * context.maximumDetentValue
            })]
            sheet.prefersGrabberVisible = true
        }
        
        present(sheetViewController, animated: true, completion: nil)
    }
    
    @objc func showVerseSheet(_ sender: UITapGestureRecognizer) {
        guard let cardView = sender.view else { return }
        guard let index = vstack.arrangedSubviews.firstIndex(of: cardView) else { return }
        
        let verseSheetViewController = VerseSheetViewController()
        verseSheetViewController.textToDisplay = savedTexts[index].text ?? ""
        verseSheetViewController.modalPresentationStyle = .pageSheet
        
        if let sheet = verseSheetViewController.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
        }
        
        present(verseSheetViewController, animated: true, completion: nil)
    }

    @objc func handleLongPress(_ sender: UILongPressGestureRecognizer) {
        guard sender.state == .began else { return }
        
        let alert = UIAlertController(title: "Delete Verse", message: "Are you sure you want to delete this verse?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
            guard let cardView = sender.view else { return }
            self.deleteVerse(at: cardView.tag)
        }))
        
        present(alert, animated: true, completion: nil)
    }
    
    func deleteVerse(at index: Int) {
        let context = CoreDataStack.shared.context
        context.delete(savedTexts[index])
        
        do {
            try context.save()
            savedTexts.remove(at: index)
            vstack.arrangedSubviews[index].removeFromSuperview()
            ifMessage()
        } catch {
            print("Failed to delete verse: \(error)")
        }
    }

    //======================= Mensagem sem versiculo =========================
    
    func ifMessage() {
        if savedTexts.isEmpty {
            messageEmpty1.isHidden = false
            messageEmpty2.isHidden = false
        } else {
            messageEmpty1.isHidden = true
            messageEmpty2.isHidden = true
        }
    }
    
    func showMessage() {
        self.view.addSubview(messageEmpty1)
        self.view.addSubview(messageEmpty2)
        
        NSLayoutConstraint.activate([
            messageEmpty1.topAnchor.constraint(equalTo: titleVerse.bottomAnchor, constant: 120),
            messageEmpty1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 63),
            messageEmpty1.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -63),
            messageEmpty2.topAnchor.constraint(equalTo: messageEmpty1.bottomAnchor, constant: 100),
            messageEmpty2.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 103),
            messageEmpty2.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -103)
        ])
    }
    
    func fetchSavedVerses() {
        let context = CoreDataStack.shared.context
        let fetchRequest: NSFetchRequest<Verse> = Verse.fetchRequest()
        
        do {
            savedTexts = try context.fetch(fetchRequest)
            for (index, verse) in savedTexts.enumerated() {
                addCard(withTitle: verse.title ?? "", text: verse.text ?? "", index: index)
            }
        } catch {
            print("Failed to fetch verses: \(error)")
        }
    }
}

extension VerseViewController: SheetViewControllerDelegate {
    func didSubmitText(title: String, text: String) {
        let context = CoreDataStack.shared.context
        guard let entity = NSEntityDescription.entity(forEntityName: "Verse", in: context) else {
            fatalError("Could not find entity description!")
        }
        let verse = Verse(entity: entity, insertInto: context)
        verse.title = title
        verse.text = text
        
        do {
            try context.save()
            savedTexts.append(verse)
            addCard(withTitle: title, text: text, index: savedTexts.count - 1)
            ifMessage()
        } catch {
            print("Failed to save verse: \(error)")
        }
    }
}


#Preview(){
    MainTabBarController()
}
