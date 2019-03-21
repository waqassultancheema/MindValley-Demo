//
// UserLists.swift
//  MindValley_iOS_Demo
//
//  Created by Waqas Sultan on 02/17/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit

protocol UserListViewControllerGetUsers
{
    func fetchItems()
}

protocol UserListViewControllerDisplayedLogic {
    func displayFetchUsers(viewModel:ViewModel.DisplayViewModel)
}

class UserListViewController: UIViewController,UserListViewControllerDisplayedLogic {

    
    @IBOutlet weak var tableView: UITableView!
    
    

    let configurator = UserListConfigurator()

    var requestUsers: UserListViewControllerGetUsers!
    var router: UserListAppRouter!
    var tableViewDataSource:UserListTableViewDataSource!

    override func awakeFromNib() {
        super.awakeFromNib()
        configurator.configure(viewController: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        

        configureTableViewDataSource()
       
        self.view.startActivityIndicator()
        self.requestUsers.fetchItems()
        handleTableViewSelection()
        // Do any additional setup after loading the view.
    }
    
    func configureTableViewDataSource() {
        tableViewDataSource  = UserListTableViewDataSource()
        tableView.delegate = tableViewDataSource
        tableView.dataSource = tableViewDataSource
    }
    
    func displayFetchUsers(viewModel: ViewModel.DisplayViewModel) {
        self.tableViewDataSource.Users = viewModel.users
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.view.stopActivityIndicator()
            
        }
    }
   
   
    
    
}
