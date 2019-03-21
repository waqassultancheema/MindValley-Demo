//
//  UserLinksBo.swift
//  MindValley_iOS_Demo
//
//  Created by Waqas Sultan on 3/17/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import Foundation

struct UserLinksBo: Codable {
    let linksSelf: String
    let html, download: String
    
    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, download
    }
}


extension UserLinksBo {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(UserLinksBo.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        linksSelf: String? = nil,
        html: String? = nil,
        download: String? = nil
        ) -> UserLinksBo {
        return UserLinksBo(
            linksSelf: linksSelf ?? self.linksSelf,
            html: html ?? self.html,
            download: download ?? self.download
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
