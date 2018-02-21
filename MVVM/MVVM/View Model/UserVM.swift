//
//  UserVM.swift
//  MVVM
//
//  Created by Admin on 2/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
import SwiftyJSON

class UserVM: NSObject {
    
    @IBOutlet var apiClient: ApiClient!
    
    var myJsonResponse  : JSON = JSON.null
    var competitionListResult : [UserDataModel] = []
    var userListData : [UserDataModel] = []
    
    func fetchUserList(onCompletion:@escaping ([UserDataModel])->Void) {
        
            apiClient.userListFromURL { (userJSON) in
                if userJSON != JSON.null {
                    
                    self.myJsonResponse = userJSON["data"]
                    print(userJSON["data"].stringValue)
                    for i in 0..<self.myJsonResponse.count{
                        let singleUser = UserDataModel(userData: self.myJsonResponse[i])
                        self.userListData.append(singleUser)
                    }
                    onCompletion(self.userListData)
                }
            }
    }
}

