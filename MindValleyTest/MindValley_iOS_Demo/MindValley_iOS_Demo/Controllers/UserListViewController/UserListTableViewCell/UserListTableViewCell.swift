//
//  UserListTableViewCell.swift
//  MindValley_iOS_Demo
//
//  Created by Waqas Sultan on 02/17/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit

class UserListTableViewCell: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var backGroundImage: ImageDownloader!
    @IBOutlet weak var activityIndictor: UIActivityIndicatorView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func downloadImage(url: String) {
        activityIndictor.startAnimating()
        self.backGroundImage.image = #imageLiteral(resourceName: "asset1")
        backGroundImage.loadImageUsingUrlString(urlString: url, activityIndictor: activityIndictor)
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
