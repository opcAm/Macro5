//
//  JoaoViewController.swift
//  MacroChallenge5
//
//  Created by Amanda Conde on 22/05/24.
//

import UIKit

class JoaoViewController: UIViewController {

    let cardInfo: UIView = {
            let v = UIView()
            v.backgroundColor = .pinkk
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
            label.text = "Os outros 3 Evangelhos estavam focando na descrição dos eventos da vida de Jesus, João foca no significado desses eventos. Os quatro evangelhos registram o milagre da alimentação de cinco mil homens, porém somente o livro de João contém a mensagem de Jesus sobre o “pão da vida”, que se seguiu após o milagre.\n\nAUTOR: João, o apóstolo\n\nPROPÓSITO: Mostrar que Jesus é o Messias, o Filho de Deus, e que todos que acreditam Nele terão vida eterna.\n\nTEMAS ABORDADOS: Jesus como único Filho de Deus, vida eterna, o Espírito Santo, luz x trevas."
            label.numberOfLines = 0
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 18)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            view.backgroundColor = .background
            
            
            setCard()
        }
        
        func setCard() {
            view.addSubview(cardInfo)
            cardInfo.addSubview(textLabel)
            
            NSLayoutConstraint.activate([
                cardInfo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                cardInfo.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -60),
                cardInfo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
                cardInfo.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),

//========================= TEXTO ================================
                textLabel.topAnchor.constraint(equalTo: cardInfo.topAnchor),
                textLabel.leadingAnchor.constraint(equalTo: cardInfo.leadingAnchor, constant: 20),
                textLabel.trailingAnchor.constraint(equalTo: cardInfo.trailingAnchor, constant: -20),
                textLabel.bottomAnchor.constraint(equalTo: cardInfo.bottomAnchor)
            ])
        }
    }
#Preview() {
    JoaoViewController()
}
