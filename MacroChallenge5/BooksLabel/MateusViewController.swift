//
//  MateusViewController.swift
//  MacroChallenge5
//
//  Created by Amanda Conde on 22/05/24.
//

import UIKit

class MateusViewController: UIViewController {
    
    let cardView: UIView = {
        let card = UIView()
        card.backgroundColor = .pinkk
        card.layer.cornerRadius = 20

        card.translatesAutoresizingMaskIntoConstraints = false
        return card
    }()
    
    let titleLabel: UILabel = {
        let t = UILabel()
        t.text = "teste"
        t.textAlignment = .center
        t.font = .systemFont(ofSize: 32)
        
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        
        setElements()
        
    }
    
    func setElements() {
        addCard()
    }
    
    func addCard() {
                
        self.view.addSubview(cardView)
        
        NSLayoutConstraint.activate([
            cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            
        ])
        
    }
}


#Preview() {
    MateusViewController()
}
