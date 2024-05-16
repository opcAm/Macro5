//
//  VersiculosViewController.swift
//  MacroChallenge5
//
//  Created by Amanda Conde on 14/05/24.
//

import UIKit

class VerseViewController: UIViewController {
    
    let buttonMore: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "plus.app"), for: .normal)
        button.tintColor = .orangee
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    view.backgroundColor = .background
            setElements()
    }
    func setElements() {
        setButtonPlus()
    }

    func setButtonPlus() {
        self.view.addSubview(buttonMore)
        
        buttonMore.addTarget(self, action: #selector(navigate), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            buttonMore.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 70),
            buttonMore.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
//            buttonMore.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 340)
        ])
        
    }
    
//    private func configureSheet() {
//        let vc = SheetViewController()
//        let navVC = UINavigationController(rootViewController: vc)
//        
//        navVC.isModalInPresentation = true
//        if let sheet = navVC.sheetPresentationController{
//            sheet.detents = [.custom(resolver: { context in
//                0.2 * context.maximumDetentValue
//            }),.custom(resolver: { context in
//                0.2 * context.maximumDetentValue
//            })]
//            sheet.largestUndimmedDetentIdentifier = .medium
//        }
//        navigationController?.present(navVC, animated: true)
//    }
    @objc func navigate() {
        navigationController?.pushViewController(SheetViewController(), animated: true)
    }
}
