//
//  Request.swift
//  MindValley_iOS_Demo
//
//  Created by Waqas Sultan on 02/17/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//


import Foundation


protocol Request {
    func getURLRequest(url: String) -> URLRequest?
}

enum RequestType: Request {
    
    init(type: RequestType) {
        self = type
    }
    
    func getURLRequest(url: String) -> URLRequest? {
        if let url = URL(string: url) {
            return URLRequest(url: url)
        }
        return nil
    }
}
