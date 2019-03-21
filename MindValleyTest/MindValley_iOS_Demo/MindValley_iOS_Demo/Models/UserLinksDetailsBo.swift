//
//  UserLinksDetailBo.swift
//  MindValley_iOS_Demo
//
//  Created by Waqas Sultan on 3/17/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import Foundation

struct UserLinksDetailsBo: Codable {
    let linksSelf: String
    let html: String
    let photos, likes: String
    
    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, photos, likes
    }
}

extension UserLinksDetailsBo {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(UserLinksDetailsBo.self, from: data)
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
        photos: String? = nil,
        likes: String? = nil
        ) -> UserLinksDetailsBo {
        return UserLinksDetailsBo(
            linksSelf: linksSelf ?? self.linksSelf,
            html: html ?? self.html,
            photos: photos ?? self.photos,
            likes: likes ?? self.likes
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

