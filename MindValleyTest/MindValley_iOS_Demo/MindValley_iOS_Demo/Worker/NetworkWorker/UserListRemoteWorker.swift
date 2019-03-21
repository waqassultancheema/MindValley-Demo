//
//  UserListRemoteApi.swift
//  MindValley_iOS_Demo
//
//  Created by Waqas Sultan on 8/23/18.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//



import UIKit
let UserList = 1
typealias Users = [UserBo]
class UserListRemoteWorker: NSObject {
   
     private var requestURLString = "\(APIURLPrefix)?page=1"

    func fetchUserLists( complete :@escaping ([UserBo]) -> Void, failure:@escaping (String?) -> Void) {
        
        ServiceApi.shared.getData(url: requestURLString, withMethod: nil, headers: nil) {  (response, error) in
            guard error == nil else {
                failure(error?.localizedDescription)
                return
            }
            
            if let mData = response as? Data {
                do {
                   let users = try Users(data: mData)
                   complete(users)
                } catch  {
                    failure(error.localizedDescription)
                }
            }
        }
    }
    
    
    
    
    
    
    
}
