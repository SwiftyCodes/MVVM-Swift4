//
//  ViewController.swift
//  MVVM
//
//  Created by Admin on 2/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class UserVC: UIViewController {

    @IBOutlet weak var userTableView: UserTableView!
    @IBOutlet var userViewModel: UserVM!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userViewModel.fetchUserList {data in
            DispatchQueue.main.async(execute: {
                self.userTableView.userListDataSource = data
            })
        }
    }
}

