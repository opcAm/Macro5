//
//  MateusViewController.swift
//  MacroChallenge5
//
//  Created by Amanda Conde on 22/05/24.
//

import UIKit

class MateusViewController: UIViewController {

    let cardInfo: UIView = {
            let v = UIView()
            v.backgroundColor = .greenDark
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
            label.text = "Esse evangelho foi escrito se preocupando com os judeus, por este motivo há muitas referências às profecias Antigo Testamento (pelo menos 129 citações), as quais Jesus cumpriu. O objetivo era mostrar aos judeus que Jesus era de fato, o Messias aguardado.\n\nAUTOR: Mateus\n\nPROPÓSITO: Apresentar Jesus como o Messias que trouxe o Reino dos Céus à Terra.\n\nTEMAS ABORDADOS: Jesus, o Messias, Reino dos Céus e a inclusão dos gentios Nele."
            label.numberOfLines = 0
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 18)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
    
    let isDone: UIView = {
        let view = UIView()
        view.backgroundColor = .greenDark
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
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            view.backgroundColor = .background
            
            setCard()
            setToggle()
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
    
    func setToggle() {
        view.addSubview(isDone)
        isDone.addSubview(toggle)
        isDone.addSubview(text)
        
        NSLayoutConstraint.activate([
            isDone.topAnchor.constraint(equalTo: cardInfo.bottomAnchor,constant: 50),
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
    }
}



#Preview() {
    MainTabBarController()
}
