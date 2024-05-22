//
//  BooksViewController.swift
//  MacroChallenge5
//
//  Created by Amanda Conde on 14/05/24.
//

import UIKit

class BooksViewController: UIViewController {
    
    let matBook: UIButton = {
        let m = UIButton()
        m.setImage(UIImage(named: "0"), for: .normal)
        
        m.translatesAutoresizingMaskIntoConstraints =  false
        return m
    }()
    let marBook: UIButton = {
        let m = UIButton()
        m.setImage(UIImage(named: "1"), for: .normal)
        
        m.translatesAutoresizingMaskIntoConstraints =  false
        return m
    }()
    let lucBook: UIButton = {
        let m = UIButton()
        m.setImage(UIImage(named: "2"), for: .normal)
        
        m.translatesAutoresizingMaskIntoConstraints =  false
        return m
    }()
    let joaoBook: UIButton = {
        let m = UIButton()
        m.setImage(UIImage(named: "3"), for: .normal)
        
        m.translatesAutoresizingMaskIntoConstraints =  false
        return m
    }()
    let genBook: UIButton = {
        let m = UIButton()
        m.setImage(UIImage(named: "4"), for: .normal)
        
        m.translatesAutoresizingMaskIntoConstraints =  false
        return m
    }()
    let exBook: UIButton = {
        let m = UIButton()
        m.setImage(UIImage(named: "5"), for: .normal)
        
        m.translatesAutoresizingMaskIntoConstraints =  false
        return m
    }()
    
//-----------------------------------------------------------------------------------------------------------
    let titleBook: UILabel = {
        let title = UILabel()
        title.text = "Livros"
        title.font = UIFont.boldSystemFont(ofSize: 34)
        title.textColor = .fonte
        title.translatesAutoresizingMaskIntoConstraints = false
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
            titleBook.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleBook.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
//-----------------------------------------------------------------------------------------------------------
    func setMat() {
        self.view.addSubview(matBook)
        
        matBook.addTarget(self, action: #selector(navigate), for: .touchDown)
        
        NSLayoutConstraint.activate([
            matBook.topAnchor.constraint(equalTo: self.titleBook.bottomAnchor, constant: 28),
            matBook.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            matBook.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
        ])
    }
    func setMar() {
        self.view.addSubview(marBook)
        
        marBook.addTarget(self, action: #selector(navigate2), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            marBook.topAnchor.constraint(equalTo: self.matBook.bottomAnchor, constant: 10),
            marBook.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            marBook.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
        ])
    }
    
    func setLuc() {
        self.view.addSubview(lucBook)
        
        lucBook.addTarget(self, action: #selector(navigate3), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            lucBook.topAnchor.constraint(equalTo: self.marBook.bottomAnchor, constant: 10),
            lucBook.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            lucBook.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
        ])
    }
    
    func setJoao() {
        self.view.addSubview(joaoBook)
        
        joaoBook.addTarget(self, action: #selector(navigate4), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            joaoBook.topAnchor.constraint(equalTo: self.lucBook.bottomAnchor, constant: 10),
            joaoBook.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            joaoBook.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
        ])
    }
    
    func setGen() {
        self.view.addSubview(genBook)
        
        genBook.addTarget(self, action: #selector(navigate5), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            genBook.topAnchor.constraint(equalTo: self.joaoBook.bottomAnchor, constant: 10),
            genBook.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            genBook.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
        ])
    }
    
    func setEx() {
        self.view.addSubview(exBook)
        
        exBook.addTarget(self, action: #selector(navigate6), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            exBook.topAnchor.constraint(equalTo: self.genBook.bottomAnchor, constant: 10),
            exBook.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            exBook.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
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
