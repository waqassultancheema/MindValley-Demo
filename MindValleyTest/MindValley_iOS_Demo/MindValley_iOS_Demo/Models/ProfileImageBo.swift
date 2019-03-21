//
//  ProfileImageBo.swift
//  MindValley_iOS_Demo
//
//  Created by Waqas Sultan on 3/17/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import Foundation

struct ProfileImageBo: Codable {
    let small, medium, large: String
}


extension ProfileImageBo {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ProfileImageBo.self, from: data)
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
        small: String? = nil,
        medium: String? = nil,
        large: String? = nil
        ) -> ProfileImageBo {
        return ProfileImageBo(
            small: small ?? self.small,
            medium: medium ?? self.medium,
            large: large ?? self.large
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
