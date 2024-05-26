//
//  BooksViewController.swift
//  MacroChallenge5
//
//  Created by Amanda Conde on 14/05/24.
//

import UIKit

class BooksViewController: UIViewController {
    
    let matBook: UIButton = {
        let c = UIButton(type: .system)
        c.setTitle("Mateus", for: .normal)
        c.backgroundColor = UIColor.greenDark
        c.setTitleColor(UIColor.fonte, for: .normal)
        
        c.layer.cornerRadius = 20
        c.layer.shadowColor = UIColor.black.cgColor
        c.layer.shadowOffset = CGSize(width: 0, height: 2)
        c.layer.shadowOpacity = 0.3
        c.layer.shadowRadius = 4
        
        c.translatesAutoresizingMaskIntoConstraints = false
        return c
    }()
    let marBook: UIButton = {
        let c = UIButton(type: .system)
        c.setTitle("Marcos", for: .normal)
        c.backgroundColor = UIColor.brownn
        c.setTitleColor(UIColor.fonte, for: .normal)
        
        c.layer.cornerRadius = 20
        c.layer.shadowColor = UIColor.black.cgColor
        c.layer.shadowOffset = CGSize(width: 0, height: 2)
        c.layer.shadowOpacity = 0.3
        c.layer.shadowRadius = 4
        
        c.translatesAutoresizingMaskIntoConstraints = false
        return c
    }()
    let lucBook: UIButton = {
        let c = UIButton(type: .system)
        c.setTitle("Lucas", for: .normal)
        c.backgroundColor = UIColor.bluee
        c.setTitleColor(UIColor.fonte, for: .normal)
        
        c.layer.cornerRadius = 20
        c.layer.shadowColor = UIColor.black.cgColor
        c.layer.shadowOffset = CGSize(width: 0, height: 2)
        c.layer.shadowOpacity = 0.3
        c.layer.shadowRadius = 4
        
        c.translatesAutoresizingMaskIntoConstraints = false
        return c
    }()
    let joaoBook: UIButton = {
        let c = UIButton(type: .system)
        c.setTitle("João", for: .normal)
        c.backgroundColor = UIColor.pinkk
        c.setTitleColor(UIColor.fonte, for: .normal)
        
        c.layer.cornerRadius = 20
        c.layer.shadowColor = UIColor.black.cgColor
        c.layer.shadowOffset = CGSize(width: 0, height: 2)
        c.layer.shadowOpacity = 0.3
        c.layer.shadowRadius = 4
        
        c.translatesAutoresizingMaskIntoConstraints = false
        return c
    }()
    let genBook: UIButton = {
        let c = UIButton(type: .system)
        c.setTitle("Gênesis", for: .normal)
        c.backgroundColor = UIColor.greenDark
        c.setTitleColor(UIColor.fonte, for: .normal)
        
        c.layer.cornerRadius = 20
        c.layer.shadowColor = UIColor.black.cgColor
        c.layer.shadowOffset = CGSize(width: 0, height: 2)
        c.layer.shadowOpacity = 0.3
        c.layer.shadowRadius = 4
        
        c.translatesAutoresizingMaskIntoConstraints = false
        return c
    }()
    let exBook: UIButton = {
        let c = UIButton(type: .system)
        c.setTitle("Êxodo", for: .normal)
        c.backgroundColor = UIColor.brownn
        c.setTitleColor(UIColor.fonte, for: .normal)
        
        c.layer.cornerRadius = 20
        c.layer.shadowColor = UIColor.black.cgColor
        c.layer.shadowOffset = CGSize(width: 0, height: 2)
        c.layer.shadowOpacity = 0.3
        c.layer.shadowRadius = 4
        
        c.translatesAutoresizingMaskIntoConstraints = false
        return c
    }()
    
//-----------------------------------------------------------------------------------------------------------
    let titleBook: UILabel = {
        let title = UILabel()
        title.text = "Livros"
        title.font = .boldSystemFont(ofSize: 34)
        title.textColor = .fonte
        title.translatesAutoresizingMaskIntoConstraints = false
        
//        if let customFont = UIFont(name: "MaliBold", size: 34) {
//            title.font = customFont
//        }
//        else {
//            print("Erro ao carregar a fonte: MaliBold")
//        }
        return title
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .background
        
        setElements()
    }
    func setElements() {
        setTitle()
        setMat()
        setMar()
        setLuc()
        setJoao()
        setGen()
        setEx()
        
    }
    
    func setTitle() {
        self.view.addSubview(titleBook)
        
        NSLayoutConstraint.activate([
            titleBook.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            titleBook.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        ])
    }
//-----------------------------------------------------------------------------------------------------------
    func setMat() {
        self.view.addSubview(matBook)
        
        matBook.addTarget(self, action: #selector(navigate), for: .touchDown)
        
        NSLayoutConstraint.activate([
            matBook.topAnchor.constraint(equalTo: titleBook.bottomAnchor,constant: 20),
            matBook.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            matBook.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            matBook.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    func setMar() {
        self.view.addSubview(marBook)
        
        marBook.addTarget(self, action: #selector(navigate2), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            marBook.topAnchor.constraint(equalTo: matBook.bottomAnchor, constant: 10),
            marBook.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            marBook.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            marBook.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    func setLuc() {
        self.view.addSubview(lucBook)
        
        lucBook.addTarget(self, action: #selector(navigate3), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            lucBook.topAnchor.constraint(equalTo: marBook.bottomAnchor, constant: 10),
            lucBook.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            lucBook.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            lucBook.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    func setJoao() {
        self.view.addSubview(joaoBook)
        
        joaoBook.addTarget(self, action: #selector(navigate4), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            joaoBook.topAnchor.constraint(equalTo: lucBook.bottomAnchor, constant: 10),
            joaoBook.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            joaoBook.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            joaoBook.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    func setGen() {
        self.view.addSubview(genBook)
        
        genBook.addTarget(self, action: #selector(navigate5), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            genBook.topAnchor.constraint(equalTo: joaoBook.bottomAnchor, constant: 10),
            genBook.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            genBook.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            genBook.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    func setEx() {
        self.view.addSubview(exBook)
        
        exBook.addTarget(self, action: #selector(navigate6), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            exBook.topAnchor.constraint(equalTo: genBook.bottomAnchor, constant: 10),
            exBook.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            exBook.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            exBook.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
//==========================================================================================================================
    @objc func navigate() {
        navigationController?.pushViewController(MateusViewController(), animated: true)
    }
    @objc func navigate2() {
        navigationController?.pushViewController(MarcosViewController(), animated: true)
    }
    @objc func navigate3() {
        navigationController?.pushViewController(LucasViewController(), animated: true)
    }
    @objc func navigate4() {
        navigationController?.pushViewController(JoaoViewController(), animated: true)
    }
    @objc func navigate5() {
        navigationController?.pushViewController(GenesisViewController(), animated: true)
    }
    @objc func navigate6() {
        navigationController?.pushViewController(ExodoViewController(), animated: true)
    }
}

#Preview(){
    MainTabBarController()
}
