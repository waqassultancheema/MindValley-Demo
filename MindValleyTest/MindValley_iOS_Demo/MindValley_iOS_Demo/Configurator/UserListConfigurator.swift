//
//  UserListConfigurator.swift
//  MindValley_iOS_Demo
//
//  Created by Waqas Sultan on 02/17/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit

protocol AlertView   {
     func displayalert(title:String, message:String)
}

extension AlertView where Self: UserListViewController {
   
    func displayalert(title:String, message:String) {
        let alert = UIAlertController(title: title, message: "\(message) \n\nPlease Press Retry", preferredStyle: UIAlertController.Style.alert)
        alert.addAction((UIAlertAction(title: "Retry", style: .default, handler: { [unowned self] (action) -> Void in
           
            self.view.startActivityIndicator()
            self.requestUsers.fetchItems()
            alert.dismiss(animated: true, completion: nil)
            
        })))
        self.present(alert, animated: true, completion: nil)
        
        
    }
}





extension UserListViewController: UserListPresenterOutput , AlertView
{
    func successFetchedUserList(viewModel: ViewModel.DisplayViewModel) {
        self.displayFetchUsers(viewModel: viewModel)
    }
    
    func errorWhileFetchingUserList(error: String) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.view.stopActivityIndicator()
            self.displayalert(title: "Error", message: error)
        }
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        router.prepare(for: segue, sender: sender)
    }
    
    func handleTableViewSelection() {
//        self.tableViewDataSource.userSelected  = { [unowned self] (user) in
//          
//
//        }
        
    }
}



extension UserListInteractor: UserListViewControllerGetUsers
{
    func fetchItems() {
          self.fetchUserList()
    }


}

extension UserListPresenter: UserListInteractorOutput
{
    func passedToPresenterFetchedUserList(user: [UserBo]) {
        self.presentFetchUserList(users: user)

    }
    
    
    func errorWhileFetchUserList(error: String) {
        self.presentFetchedError(error: error)
    }
    
   
}

class UserListConfigurator: NSObject {

    let presenter = UserListPresenter()
    let interactor = UserListInteractor()
    let router = UserListAppRouter()


    // MARK: - Configuration

    func configure(viewController: UserListViewController)
    {
        router.UserListViewController = viewController


        presenter.output = viewController
        

        interactor.output = presenter

        viewController.requestUsers = interactor
        viewController.router = router
    }
}
