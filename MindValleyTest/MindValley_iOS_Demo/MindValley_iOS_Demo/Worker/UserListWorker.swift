//
//  UserListWorker.swift
//  MindValley_iOS_Demo
//
//  Created by Waqas Sultan on 2/28/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//


class UserListWorker {
    

    func fetchUserLists( complete :@escaping ([UserBo]) -> Void, failure:@escaping (String?) -> Void) {
        
        let localWorker = UserListLocalWorker()

        localWorker.fetchLocalUsers(complete: { [unowned self ] (users) in
            
            if users.count == 0 {
                self.fetchRemoteUsers(complete: { (Users) in
                    complete(Users)
                }, failure: { (error) in
                    failure(error)
                })
            } else {
                complete(users)
            }
        }) { (error) in
            self.fetchRemoteUsers(complete: { (users) in
                complete(users)
            }, failure: { (error) in
                failure(error)
            })
        }
        
    }
    
    func fetchRemoteUsers( complete :@escaping ([UserBo]) -> Void, failure:@escaping (String?) -> Void) {
        
        let remoteWorker = UserListRemoteWorker()
        
        remoteWorker.fetchUserLists(complete: { [unowned self] (Users) in
            self.saveRemoteUsersToLocal(Users: Users, complete: { (sucess) in
                complete(Users)
            }, failure: { (error) in
               complete(Users)
            })
        }) { (error) in
            failure(error)
        }
        
    }
    
    func saveRemoteUsersToLocal(Users: [UserBo], complete: @escaping (Bool?) -> Void, failure:@escaping (String?) -> Void) {
        complete(true)
//        let localWorker = UserListLocalWorker()
//
//        localWorker.saveLocalUsers(Users: Users) { (success, error) in
//            if success ?? false {
//                complete(success)
//            } else {
//                failure("Can not Save")
//            }
//        }
        
    }
}
