//
//  LucasViewController.swift
//  MacroChallenge5
//
//  Created by Amanda Conde on 22/05/24.
//

import UIKit
import CoreData

class LucasViewController: UIViewController {

    let cardInfo: UIView = {
        let v = UIView()
        v.backgroundColor = .bluee
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
        label.text = "Lucas foi um gentio que creu em Jesus. O seu propósito era escrever um relato de vida, da morte e da ressurreição de Jesus Cristo, era tornar a mensagem da salvação compreensível para os que eram alheios à cultura dos judeus.\n\nAUTOR: Lucas\n\nPROPÓSITO: Apresentar um relato fiel da vida e ministério de Jesus\n\nTEMAS ABORDADOS: Jesus Cristo, o Salvador, o Espírito Santo, compaixão pelo oprimido, salvação par os gentios."
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let isDone: UIView = {
        let view = UIView()
        view.backgroundColor = .bluee
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
        loadVerseState() // Carrega o estado do versículo
    }
    
    func setCard() {
        view.addSubview(cardInfo)
        cardInfo.addSubview(textLabel)
        
        NSLayoutConstraint.activate([
            cardInfo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardInfo.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -60),
            cardInfo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            cardInfo.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.46),
            
            textLabel.topAnchor.constraint(equalTo: cardInfo.topAnchor),
            textLabel.leadingAnchor.constraint(equalTo: cardInfo.leadingAnchor, constant: 20),
            textLabel.trailingAnchor.constraint(equalTo: cardInfo.trailingAnchor, constant: -20),
            textLabel.bottomAnchor.constraint(equalTo: cardInfo.bottomAnchor)
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
        fetchRequest.predicate = NSPredicate(format: "title == %@", "Lucas")
        
        do {
            let verses = try context.fetch(fetchRequest)
            if let verse = verses.first {
                self.verse = verse
                isToggleOn = verse.doneLuc
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
        verse.title = "Lucas"
        verse.text = textLabel.text
        verse.doneLuc = false
        
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
        verse.doneLuc = isToggleOn
        
        do {
            try CoreDataStack.shared.context.save()
            print("Verse state saved successfully.")
        } catch {
            print("Failed to save verse state: \(error)")
        }
    }
}
#Preview() {
    LucasViewController()
}
