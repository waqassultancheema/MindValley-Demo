//
//  UserListAppRouter.swift
//  MindValley_iOS_Demo
//
//  Created by Waqas Sultan on 02/17/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit

protocol UserListAppRouterView {
    func showDetailViewController(User:ViewModel.DisplayViewModel.UserListViewModel)
    func prepare(for segue: UIStoryboardSegue, sender: Any?)
}

class UserListAppRouter: UserListAppRouterView {
    
    
    
    
    var UserListViewController:UserListViewController? = nil
    var navigationController:UINavigationController? = nil
    
    var selectedUser:ViewModel.DisplayViewModel.UserListViewModel?
    
    func showDetailViewController(User: ViewModel.DisplayViewModel.UserListViewModel) {
        selectedUser = User
        UserListViewController?.performSegue(withIdentifier: "showDetail", sender: nil)
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
    }
    

  
  
    
    
}

