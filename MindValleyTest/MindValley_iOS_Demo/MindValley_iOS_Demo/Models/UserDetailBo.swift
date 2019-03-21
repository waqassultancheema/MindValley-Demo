//
//  UserDetailBo.swift
//  MindValley_iOS_Demo
//
//  Created by Waqas Sultan on 3/17/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import Foundation

struct UserDetailsBo: Codable {
    let id, username, name: String
    let profileImage: ProfileImageBo
    let links: UserLinksDetailsBo
    
    enum CodingKeys: String, CodingKey {
        case id, username, name
        case profileImage = "profile_image"
        case links
    }
}

extension UserDetailsBo {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(UserDetailsBo.self, from: data)
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
        id: String? = nil,
        username: String? = nil,
        name: String? = nil,
        profileImage: ProfileImageBo? = nil,
        links: UserLinksDetailsBo? = nil
        ) -> UserDetailsBo {
        return UserDetailsBo(
            id: id ?? self.id,
            username: username ?? self.username,
            name: name ?? self.name,
            profileImage: profileImage ?? self.profileImage,
            links: links ?? self.links
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
