//
//  MainTabBarController.swift
//  MacroChallenge5
//
//  Created by Amanda Conde on 14/05/24.

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.tintColor = .orangee
        self.tabBar.barTintColor = .orangee
        self.tabBar.backgroundColor = .systemBackground
        
        configTabBars()
    }
    
    func configTabBars(){
        let booksViewController = UINavigationController(rootViewController: BooksViewController())
        booksViewController.tabBarItem.title = "Livros"
        booksViewController.tabBarItem.image = UIImage(systemName: "book.closed")
        booksViewController.tabBarItem.selectedImage = UIImage(systemName: "book.closed.fill")
        
        let verseViewController = UINavigationController(rootViewController: VerseViewController())
        verseViewController.tabBarItem.title = "Versículos"
        verseViewController.tabBarItem.image = UIImage(systemName: "doc.append")
        verseViewController.tabBarItem.selectedImage = UIImage(systemName: "doc.append.fill")
        let futureViewController = UINavigationController(rootViewController: FutureViewController())
        futureViewController.tabBarItem.title = "Teu tempo"
        futureViewController.tabBarItem.image = UIImage(systemName: "clock")
        futureViewController.tabBarItem.selectedImage = UIImage(systemName: "clock.fill")
        
        self.setViewControllers([booksViewController, verseViewController, futureViewController], animated: true)
    }
}

#Preview(){
    return MainTabBarController()
}
