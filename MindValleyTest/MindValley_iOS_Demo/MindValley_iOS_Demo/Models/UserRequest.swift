//
//  UserRequest.swift
//  MindValley_iOS_Demo
//
//  Created by Waqas Sultan on 3/18/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import Foundation

struct ViewModel {
    
    
    struct DisplayViewModel {
        struct UserListViewModel {
            var title:String = ""
            var imageLink:String = ""
            var id:String = ""
            
        }
        var users:[DisplayViewModel.UserListViewModel]
    }
    
    
}
