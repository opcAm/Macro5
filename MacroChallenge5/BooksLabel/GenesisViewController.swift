//
//  GenesisViewController.swift
//  MacroChallenge5
//
//  Created by Amanda Conde on 22/05/24.
//

import UIKit

class GenesisViewController: UIViewController {

    let cardInfo: UIView = {
            let v = UIView()
            v.backgroundColor = .greenDark
            v.layer.cornerRadius = 10
            v.layer.shadowColor = UIColor.black.cgColor
        v.layer.shadowOpacity = 0.3
            v.layer.shadowOffset = CGSize(width: 0, height: 5)
            v.layer.shadowRadius = 10
            return v
        }()
        
        let textLabel: UILabel = {
            let label = UILabel()
            label.text = "Primeiro livro da Bíblia, Gênesis significa “origem” e descreve algo que está se formando. Aqui estão relatados importantes inícios, como a criação, a queda do homem, e os primeiros anos da nação de Israel.\n\nAUTOR: Moisés - segundo a tradição judaica\n\nPROPÓSITO: Mostrar como o mundo e tudo nele vieram a existir, e o desejo de Deus em ter um povo separado para adorá-lo.\n\nTEMAS ABORDADOS: Origem do mundo, humanidade, pecado e nação de Israel. Soberania e fidelidade de Deus. Obediência e bênção."
            label.numberOfLines = 0
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 18)
            return label
        }()
        
    let cardDone: UIView = {
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
    
    let textDone: UILabel = {
        let label = UILabel()
        label.text = "Já finalizou o estudo deste livro?"
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let toggleImage: UIImageView = {
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
        view.addSubview(cardInfo)
        cardInfo.addSubview(textLabel)
        
        setCard()
        setToggle()
    }
        
        func setCard() {
            cardInfo.translatesAutoresizingMaskIntoConstraints = false
            textLabel.translatesAutoresizingMaskIntoConstraints = false
            
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
        view.addSubview(cardDone)
        cardDone.addSubview(toggleImage)
        cardDone.addSubview(textDone)
        
        NSLayoutConstraint.activate([
            cardDone.topAnchor.constraint(equalTo: cardInfo.bottomAnchor,constant: 50),
            cardDone.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cardDone.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            cardDone.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06),
            
            textDone.centerYAnchor.constraint(equalTo: cardDone.centerYAnchor),
            textDone.leadingAnchor.constraint(equalTo: cardDone.leadingAnchor, constant: 20),
            textDone.trailingAnchor.constraint(equalTo: cardDone.trailingAnchor, constant: -20),
            
            toggleImage.topAnchor.constraint(equalTo: cardDone.topAnchor, constant: 10),
            toggleImage.centerXAnchor.constraint(equalTo: textDone.rightAnchor, constant: -10),
            toggleImage.bottomAnchor.constraint(equalTo: cardDone.bottomAnchor, constant: -10),
            toggleImage.widthAnchor.constraint(equalToConstant: 20),
            toggleImage.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleCardTap))
        cardDone.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleCardTap() {
        isToggleOn.toggle()
        let imageName = isToggleOn ? "checkmark.circle.fill" : "checkmark.circle"
        
        toggleImage.image = UIImage(systemName: imageName)
    }
}
#Preview() {
    GenesisViewController()
}
