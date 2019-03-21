//
//  UserListPresenter.swift
//  MindValley_iOS_Demo
//
//  Created by Waqas Sultan on 02/17/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//


import UIKit
protocol UserListPresenterInput
{
    func presentFetchUserList(users:[UserBo])
    func presentFetchedError(error:String)
}

protocol UserListPresenterOutput: class
{
    func successFetchedUserList(viewModel: ViewModel.DisplayViewModel)
    func errorWhileFetchingUserList(error:String)
}
class UserListPresenter:UserListPresenterInput {
 
    var output:UserListPresenterOutput!
    
    func presentFetchUserList(users: [UserBo]) {
        if let output  = output {
            
            if users.count == 0 {
               output.errorWhileFetchingUserList(error: "No Users Found")
            }

            let usersDisplayModel =  convertDataIntoViewModel(Users: users)
            
            let viewModel = ViewModel.DisplayViewModel.init(users: usersDisplayModel)
            
            output.successFetchedUserList(viewModel:viewModel)
        }
       

    }
    
    func presentFetchedError(error: String) {
         output.errorWhileFetchingUserList(error: error)
    }
    
    
    func convertDataIntoViewModel(Users:[UserBo]) ->  [ViewModel.DisplayViewModel.UserListViewModel] {

        var displayViewModels:[ViewModel.DisplayViewModel.UserListViewModel] = []

        for user in Users {

                var userListViewModel:ViewModel.DisplayViewModel.UserListViewModel = ViewModel.DisplayViewModel.UserListViewModel()
                userListViewModel.title = user.user.name
                userListViewModel.imageLink = user.urls.regular
                userListViewModel.id = user.id
                displayViewModels.append(userListViewModel)
            }
        return displayViewModels
    }
}


