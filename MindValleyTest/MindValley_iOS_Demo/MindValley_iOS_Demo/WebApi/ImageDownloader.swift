//
//  ImageDownloader.swift
//  MarvelDemoApp
//
//  Created by Waqas Sultan on 5/21/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

class ImageDownloader: UIImageView {
    
    var imageUrlString: String?
    
    func loadImageUsingUrlString(urlString: String,activityIndictor:UIActivityIndicatorView) {
        
        imageUrlString = urlString
        
        image = nil
        
        ServiceApi.shared.getData(url: urlString, withMethod: nil, headers: nil) { [unowned self] (data, error) in
            if error != nil {
                print(error ?? "")
                 DispatchQueue.main.async {
                    self.image  = #imageLiteral(resourceName: "asset1")
                activityIndictor.stopAnimating()
                }

                return
            }
            
            DispatchQueue.main.async {
                
                if let d = data {
                    let imageToCache = UIImage(data: d as! Data)
                    
                    if self.imageUrlString == urlString {
                        self.image = imageToCache
                    }
                    if let imageToCac = imageToCache {
                        imageCache.setObject(imageToCac, forKey: urlString as NSString)
                    }
                } else {
                    self.image  = #imageLiteral(resourceName: "asset1")
                }
                activityIndictor.stopAnimating()
            }
        }
    }
    
}

