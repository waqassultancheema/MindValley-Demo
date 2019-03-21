//
//  UserBo.swift
//  MindValley_iOS_Demo
//
//  Created by Waqas Sultan on 3/17/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import Foundation


struct UserBo: Codable {
    let id: String
    let createdAt: Date
    let width, height: Int
    let color: String
    let likes: Int
    let likedByUser: Bool
    let user: UserDetailsBo
    let currentUserCollections: [JSONAny]
    let urls: UrlsBo
    let categories: [CategoryBo]
    let links: UserLinksBo
    
    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case width, height, color, likes
        case likedByUser = "liked_by_user"
        case user
        case currentUserCollections = "current_user_collections"
        case urls, categories, links
    }
}














// MARK: Convenience initializers and mutators

extension UserBo {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(UserBo.self, from: data)
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
        createdAt: Date? = nil,
        width: Int? = nil,
        height: Int? = nil,
        color: String? = nil,
        likes: Int? = nil,
        likedByUser: Bool? = nil,
        user: UserDetailsBo? = nil,
        currentUserCollections: [JSONAny]? = nil,
        urls: UrlsBo? = nil,
        categories: [CategoryBo]? = nil,
        links: UserLinksBo? = nil
        ) -> UserBo {
        return UserBo(
            id: id ?? self.id,
            createdAt: createdAt ?? self.createdAt,
            width: width ?? self.width,
            height: height ?? self.height,
            color: color ?? self.color,
            likes: likes ?? self.likes,
            likedByUser: likedByUser ?? self.likedByUser,
            user: user ?? self.user,
            currentUserCollections: currentUserCollections ?? self.currentUserCollections,
            urls: urls ?? self.urls,
            categories: categories ?? self.categories,
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














// MARK: - URLSession response handlers

extension URLSession {
    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
        }
    }
    
    func usersTask(with url: URL, completionHandler: @escaping (Users?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}

