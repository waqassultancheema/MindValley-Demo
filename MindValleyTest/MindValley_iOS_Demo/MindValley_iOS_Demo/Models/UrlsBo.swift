//
//  UrlBo.swift
//  MindValley_iOS_Demo
//
//  Created by Waqas Sultan on 3/17/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit

struct UrlsBo: Codable {
    let raw, full, regular, small: String
    let thumb: String
}


extension UrlsBo {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(UrlsBo.self, from: data)
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
        raw: String? = nil,
        full: String? = nil,
        regular: String? = nil,
        small: String? = nil,
        thumb: String? = nil
        ) -> UrlsBo {
        return UrlsBo(
            raw: raw ?? self.raw,
            full: full ?? self.full,
            regular: regular ?? self.regular,
            small: small ?? self.small,
            thumb: thumb ?? self.thumb
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
