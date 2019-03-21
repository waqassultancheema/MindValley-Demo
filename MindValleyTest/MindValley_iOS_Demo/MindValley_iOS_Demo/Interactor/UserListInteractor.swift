//
//  UserListInteractor.swift
//  MindValley_iOS_Demo
//
//  Created by Waqas Sultan on 02/17/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit

protocol UserListInteractorInput {

    func fetchUserList()
}

protocol UserListInteractorOutput {
    func passedToPresenterFetchedUserList(user:[UserBo])
    func errorWhileFetchUserList(error:String)


}
class UserListInteractor:UserListInteractorInput {

    var output: UserListInteractorOutput!
    var worker: UserListWorker!
    
    func fetchUserList() {
        if worker == nil {
            worker = UserListWorker()
        }
        worker.fetchUserLists( complete: { [unowned self] (user) in
            self.output.passedToPresenterFetchedUserList(user: user)
        }) { (error) in
            self.output.errorWhileFetchUserList(error: error ?? "Error Occured While Fetching")

        }
        
       }

}
