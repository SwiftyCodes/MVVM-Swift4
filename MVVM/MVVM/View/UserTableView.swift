//
//  UserTableView.swift
//  ImplemtationMVC
//
//  Created by Admin on 2/8/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import SDWebImage

class UserTableView: UITableView {
    
    var userListDataSource = [UserDataModel]() {
        
        didSet {
            reloadData()
        }
    }
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.dataSource=self
    }
}

extension UserTableView : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userListDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UserListCell
        let userListValues = userListDataSource[indexPath.row]
        cell.firstName.text = userListValues.userFirstName
        cell.lastName.text = userListValues.userLastName
        
        if let avatarString = userListValues.avatar {
            
            cell.userImage.sd_setImage(with: URL(string: avatarString), placeholderImage: UIImage(named: "placeholder.png"))
            
        }
        
        return cell
    }
    
}

class UserListCell: UITableViewCell {
    
    @IBOutlet weak var firstName : UILabel!
    @IBOutlet weak var lastName : UILabel!
    @IBOutlet weak var userImage : UIImageView!
    
}
