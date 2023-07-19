//
//  ViewController.swift
//  BaoNai.2
//
//  Created by Nam Nguyen on 7/18/23.
//

import UIKit

class BNTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setUpTabs()
    }
    
    private func setUpTabs() {
        let hiringVC = BNHiringViewController()
        let forsaleVC = BNForsaleViewController()
        let homeVC = BNHomeViewController()
        let favoriteVC = BNFavoriteViewController()
        let moreVC = BNMoreViewController()
        
        hiringVC.navigationItem.largeTitleDisplayMode = .automatic
        forsaleVC.navigationItem.largeTitleDisplayMode = .automatic
        homeVC.navigationItem.largeTitleDisplayMode = .automatic
        favoriteVC.navigationItem.largeTitleDisplayMode = .automatic
        moreVC.navigationItem.largeTitleDisplayMode = .automatic

        
        let nav1 = UINavigationController(rootViewController: hiringVC)
        let nav2 = UINavigationController(rootViewController: forsaleVC)
        let nav3 = UINavigationController(rootViewController: homeVC)
        let nav4 = UINavigationController(rootViewController: favoriteVC)
        let nav5 = UINavigationController(rootViewController: moreVC)

        
        nav1.tabBarItem = UITabBarItem(title: "Hiring",
                                       image: UIImage(systemName: "person"),
                                       tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Forsale",
                                       image: UIImage(systemName: "scroll"),
                                       tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Home",
                                       image: UIImage(systemName: "house"),
                                       tag: 3)
        nav4.tabBarItem = UITabBarItem(title: "Favorite",
                                       image: UIImage(systemName: "heart"),
                                       tag: 4)
        nav5.tabBarItem = UITabBarItem(title: "More",
                                       image: UIImage(systemName: "ellipsis"),
                                       tag: 5)
        for nav in [nav1, nav2, nav3, nav4, nav5] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        setViewControllers(
            [nav1, nav2, nav3, nav4, nav5],
            animated: true
        )
    }
}

