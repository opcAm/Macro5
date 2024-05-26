//
//  MarcosViewController.swift
//  MacroChallenge5
//
//  Created by Amanda Conde on 22/05/24.
//

import UIKit
import CoreData

class MarcosViewController: UIViewController {
    
    let cardInfo: UIView = {
        let v = UIView()
        v.backgroundColor = .brownn
        v.layer.cornerRadius = 10
        v.layer.shadowColor = UIColor.black.cgColor
        v.layer.shadowOpacity = 0.3
        v.layer.shadowOffset = CGSize(width: 0, height: 5)
        v.layer.shadowRadius = 10
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "O Evangelho de Marcos é um relato de vida, ministério, dos milagres e palavra de Jesus Cristo. Contrariando Mateus, que apresenta Jesus como Messias, Marcos enfatiza a servidão do Senhor.\n\nAUTOR: João Marcos\n\nPROPÓSITO: Apresentar Jesus Cristo como servo e Filho de Deus, recontando Seu ministério e ensinamentos.\n\nTEMAS ABORDADOS: Jesus, o Messias, servidão/ministério, milagres."
        
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let isDone: UIView = {
        let view = UIView()
        view.backgroundColor = .brownn
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.layer.shadowRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let text: UILabel = {
        let label = UILabel()
        label.text = "Já finalizou o estudo deste livro?"
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let toggle: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "checkmark.circle")
        image.tintColor = .systemBlue
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var isToggleOn = false
    var verse: Verse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .background
        
        setCard()
        setToggle()
        loadVerseState()
    }
    
    func setCard() {
        view.addSubview(cardInfo)
        cardInfo.addSubview(textLabel)
        
        NSLayoutConstraint.activate([
            cardInfo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardInfo.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80),
            cardInfo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            cardInfo.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.42),
            
            textLabel.topAnchor.constraint(equalTo: cardInfo.topAnchor, constant: 20),
            textLabel.leadingAnchor.constraint(equalTo: cardInfo.leadingAnchor, constant: 20),
            textLabel.trailingAnchor.constraint(equalTo: cardInfo.trailingAnchor, constant: -20),
            textLabel.bottomAnchor.constraint(equalTo: cardInfo.bottomAnchor, constant: -20)
        ])
    }
    
    func setToggle() {
        view.addSubview(isDone)
        isDone.addSubview(toggle)
        isDone.addSubview(text)
        
        NSLayoutConstraint.activate([
            isDone.topAnchor.constraint(equalTo: cardInfo.bottomAnchor, constant: 50),
            isDone.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            isDone.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            isDone.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06),
            
            text.centerYAnchor.constraint(equalTo: isDone.centerYAnchor),
            text.leadingAnchor.constraint(equalTo: isDone.leadingAnchor, constant: 20),
            text.trailingAnchor.constraint(equalTo: isDone.trailingAnchor, constant: -20),
            
            toggle.topAnchor.constraint(equalTo: isDone.topAnchor, constant: 10),
            toggle.centerXAnchor.constraint(equalTo: text.rightAnchor, constant: -10),
            toggle.bottomAnchor.constraint(equalTo: isDone.bottomAnchor, constant: -10),
            toggle.widthAnchor.constraint(equalToConstant: 20),
            toggle.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleCardTap))
        isDone.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleCardTap() {
        isToggleOn.toggle()
        let imageName = isToggleOn ? "checkmark.circle.fill" : "checkmark.circle"
        
        toggle.image = UIImage(systemName: imageName)
        saveVerseState()
    }
    
    func loadVerseState() {
        print("Loading verse state...")
        let context = CoreDataStack.shared.context
        let fetchRequest: NSFetchRequest<Verse> = Verse.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "title == %@", "Marcos")
        
        do {
            let verses = try context.fetch(fetchRequest)
            if let verse = verses.first {
                self.verse = verse
                isToggleOn = verse.doneMar
                let imageName = isToggleOn ? "checkmark.circle.fill" : "checkmark.circle"
                toggle.image = UIImage(systemName: imageName)
                print("Verse state loaded successfully.")
            } else {
                print("No verse found, creating a new one.")
                createVerse(context: context)
            }
        } catch {
            print("Failed to fetch verse: \(error)")
        }
    }
    
    func createVerse(context: NSManagedObjectContext) {
        print("Creating a new verse...")
        let verse = Verse(context: context)
        verse.title = "Marcos"
        verse.text = textLabel.text
        verse.doneMar = false
        
        do {
            try context.save()
            self.verse = verse
            print("Verse created successfully.")
        } catch {
            print("Failed to create verse: \(error)")
        }
    }
    
    func saveVerseState() {
        print("Saving verse state...")
        guard let verse = verse else { return }
        verse.doneMar = isToggleOn
        
        do {
            try CoreDataStack.shared.context.save()
            print("Verse state saved successfully.")
        } catch {
            print("Failed to save verse state: \(error)")
        }
    }
}


#Preview() {
    MarcosViewController()
}
