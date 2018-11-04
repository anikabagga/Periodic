//
//  DonatorFeedVC.swift
//  periodic.
//
//  Created by Anika Bagga on 11/3/18.
//  Copyright © 2018 Anika Bagga. All rights reserved.
//

import UIKit

class DonatorFeedVC: UITabBarController {
    
    var logoutButton: UIButton!
    var feedTableView: UITableView!
    var posts: [Post] = []
    var selectedPost: Post!
    let airPinkColor = UIColor(red: 255/255.0, green: 148/255.0, blue: 153/255.0, alpha: 1.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBar()
        setupTableView()
        // Do any additional setup after loading the view.
    }

    func setupNavigationBar(){
    self.navigationItem.title = "My Feed"
    self.navigationController?.navigationBar.tintColor = .white
    self.navigationController?.navigationBar.barTintColor = airPinkColor
    let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
    navigationController?.navigationBar.titleTextAttributes = textAttributes
    
    logoutButton = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 30))
    logoutButton.setTitle("Log Out", for: .normal)
    logoutButton.setTitleColor(.white, for: .normal)
    logoutButton.addTarget(self, action: #selector(logOut), for: .touchUpInside)
    self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: logoutButton)
    
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(newPost))
    }
    

}
