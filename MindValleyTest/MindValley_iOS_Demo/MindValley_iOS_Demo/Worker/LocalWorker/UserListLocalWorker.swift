//
//  UserListRemoteApi.swift
//  MindValley_iOS_Demo
//
//  Created by Waqas Sultan on 8/23/18.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//



class UserListLocalWorker {
   

    
    func fetchLocalUsers( complete :@escaping ([UserBo]) -> Void, failure:@escaping (String?) -> Void) {
        
    
       
       failure("No Users Found")
    }
    
    func saveLocalUsers(Users: [UserBo], complete: @escaping (Bool?, String?) -> Void) {
        
        
    }
    
    
    
    
    
    
    
}
