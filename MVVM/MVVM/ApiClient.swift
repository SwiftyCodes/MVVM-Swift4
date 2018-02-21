//
//  ApiClient.swift
//  MVVM
//
//  Created by Admin on 2/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class ApiClient: NSObject {

    var tempResponse : JSON = JSON.null
    
    //MARK:- Api Call- userListFromURL()
    func userListFromURL(onCompletion:@escaping (JSON)->Void){
        
        let url =   NSURL(string: Constants().userListURL)
        var request =   URLRequest(url: url! as URL)
        request.httpMethod="GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        Alamofire.request(request as URLRequestConvertible).responseJSON(){ response in
            
            switch response.result
            {
            case .success(let data):
                self.tempResponse = JSON(data)
                onCompletion(self.tempResponse)
                
            case .failure(let error):
                print(error)
                onCompletion(JSON.null)
            }
        }
    }    
}
