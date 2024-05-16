//
//  FuturoViewController.swift
//  MacroChallenge5
//
//  Created by Amanda Conde on 14/05/24.
//

import UIKit

class FutureViewController: UIViewController {

    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let text01: UILabel = {
       let text = UILabel()
        
        text.text = "Em breve..."
        text.font = UIFont.boldSystemFont(ofSize: 32)
        text.textColor = UIColor(named: "GreenDark")
        
        text.translatesAutoresizingMaskIntoConstraints = false
        
        return text
    }()
    let text02: UILabel = {
       let text = UILabel()
        
        text.text = "Um espaço reservado para você separar um momento com o Senhor, para estimular seu tempo de oração, meditação, devocional e muito mais!"
        text.font = UIFont.boldSystemFont(ofSize: 21)
        text.textColor = UIColor(named: "GreenDark")
        text.numberOfLines = .max
        text.textAlignment = .center
        
        text.translatesAutoresizingMaskIntoConstraints = false
        
        return text
    }()
    
    let image: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "Ferramenta.png")
        
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "future view"
        view.backgroundColor = .background
        setElements()
        
    }
    
    func setElements() {
        setScrollView()
        setText1()
        setText2()
        setImage()
    }
    func setScrollView () {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func setText1() {
        self.view.addSubview(text01)
        NSLayoutConstraint.activate([
            text01.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 114),
            text01.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 114),
            text01.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 333)
        ])
        }
    
    func setText2() {
        self.view.addSubview(text02)
        NSLayoutConstraint.activate([
            text02.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 28),
            text02.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -27),
            text02.topAnchor.constraint(equalTo: text01.bottomAnchor, constant: 40)
//            text02.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -179)
            
        ])
    }
    
    func setImage() {
        self.view.addSubview(image)
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 170),
            image.bottomAnchor.constraint(equalTo: text01.topAnchor, constant: -42)
        
        ])
    }
}

#Preview(){
    return FutureViewController()
}
