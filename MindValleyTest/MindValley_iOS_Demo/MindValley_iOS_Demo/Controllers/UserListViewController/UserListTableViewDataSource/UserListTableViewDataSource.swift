//
//  UserListTableViewDataSource.swift
//  MindValley_iOS_Demo
//
//  Created by Waqas Sultan on 02/17/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit

class UserListTableViewDataSource: NSObject,UITableViewDelegate,UITableViewDataSource {
    
    var Users:[ViewModel.DisplayViewModel.UserListViewModel] = Array<ViewModel.DisplayViewModel.UserListViewModel>()
    
    public var userSelected: ((ViewModel.DisplayViewModel.UserListViewModel) -> ())?

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UserListTableViewCell = tableView.dequeueReusableCell(withIdentifier: "UserListTableViewCell", for: indexPath) as! UserListTableViewCell
        
        let user:ViewModel.DisplayViewModel.UserListViewModel = Users[indexPath.row]

        cell.labelTitle.text = user.title
        cell.downloadImage(url: user.imageLink)


        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user:ViewModel.DisplayViewModel.UserListViewModel = Users[indexPath.row]

        self.userSelected!(user)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return  1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  Users.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    

    
}
