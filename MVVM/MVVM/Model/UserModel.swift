//
//  UserModel.swift
//  MVVM
//
//  Created by Admin on 2/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
import SwiftyJSON

class UserModel: NSObject {
    
    var userData : UserDataModel!
    
    init(user : JSON) {
        self.userData = UserDataModel(userData: user["data"])
    }
}

class UserDataModel: NSObject {
    
    var userFirstName : String!
    var userLastName : String!
    var avatar : String!
    
    init(userData : JSON) {
        
        self.userFirstName = userData["first_name"].stringValue
        self.userLastName = userData["last_name"].stringValue
        self.avatar = userData["avatar"].stringValue
        
    }
}
