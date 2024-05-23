//
//  ExodoViewController.swift
//  MacroChallenge5
//
//  Created by Amanda Conde on 22/05/24.
//

import UIKit

class ExodoViewController: UIViewController {

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
            label.text = "Este livro é sobre libertação. O povo de Israel se mudou para o Egito durante a fome, e quando estiveram lá, tornaram-se escravos. Por serem o povo de Deus, Ele escolheu Moisés para tirá-los do Egito e levá-los à Terra Prometida (Canaã). No caminho, os israelitas pararam no monte Sinai, onde Deus deu ao Seu povo, os Dez Mandamentos.\n\nAUTOR: Moisés - segundo a tradição judaica\n\nPROPÓSITO: Registrar os eventos da libertação de Israel e seu desenvolvimento como nação.\n\nTEMAS ABORDADOS: A soberania, orientação, redenção e o concerto de Deus com Israel. Obediência."
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
    ExodoViewController()
}
