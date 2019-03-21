//
//  CategoryBo.swift
//  MindValley_iOS_Demo
//
//  Created by Waqas Sultan on 3/17/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//


import Foundation

struct CategoryBo: Codable {
    let id: Int
    let title: String
    let photoCount: Int
    let links: CategoryLinksBo
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case photoCount = "photo_count"
        case links
    }
}

extension CategoryBo {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CategoryBo.self, from: data)
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
        id: Int? = nil,
        title: String? = nil,
        photoCount: Int? = nil,
        links: CategoryLinksBo? = nil
        ) -> CategoryBo {
        return CategoryBo(
            id: id ?? self.id,
            title: title ?? self.title,
            photoCount: photoCount ?? self.photoCount,
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
