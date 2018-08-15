//
//  MainTabBarController.swift
//  TaskO
//
//  Created by Ulan Nurmamatov on 8/14/18.
//  Copyright © 2018 Ulan Nurmamatov. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarItems()
    }
    
    func setupTabBarItems() {
        let postsViewController = UINavigationController(rootViewController: PostsViewController())
        let postsTabBarItem = UITabBarItem(title: "Посты", image: #imageLiteral(resourceName: "posts"), tag: 0)
        postsViewController.tabBarItem = postsTabBarItem
        
        let albumsViewController = UINavigationController(rootViewController: AlbumsViewController())
        let albumsTabBarItem = UITabBarItem(title: "Альбомы", image: #imageLiteral(resourceName: "albums"), tag: 1)
        albumsViewController.tabBarItem = albumsTabBarItem
        
        self.viewControllers = [postsViewController, albumsViewController]
    }
}
