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
            v.backgroundColor = .pinkk
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
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            view.backgroundColor = .background
            view.addSubview(cardInfo)
            cardInfo.addSubview(textLabel)
            
            setupConstraints()
        }
        
        func setupConstraints() {
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
    }
#Preview() {
    GenesisViewController()
}
