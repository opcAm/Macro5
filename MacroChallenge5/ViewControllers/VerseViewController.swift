//
//  VersiculosViewController.swift
//  MacroChallenge5
//
//  Created by Amanda Conde on 14/05/24.
//

import UIKit

class VerseViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .background
        let button = UIButton (configuration: .filled(),primaryAction: .init(handler: { _ in
            
            let storyboard = UIStoryboard(name: "Sheet", bundle: nil)
            let sheetPresentationController = storyboard.instantiateViewController(withIdentifier: "SheetViewController") as! SheetViewController
            self.present(sheetPresentationController, animated: true)
        }))
//        button.setImage(UIImage(systemName: "plus.app"), for: .normal)
        button.setTitle("TESTE", for: .normal)
        button.tintColor = .orangee
        button.configuration?.cornerStyle = .capsule
        view.addSubview(button)
        
        //constraints
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
//        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 355).isActive = true
//        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
    
}
#Preview(){
    VerseViewController()
}
