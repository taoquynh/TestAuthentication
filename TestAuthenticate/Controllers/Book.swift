//
//  Book.swift
//  TestAuthenticate
//
//  Created by Taof on 3/29/21.
//

import Foundation

struct JSON {
    static let encoder = JSONEncoder()
}

extension Encodable {
    // đoạn này sẽ convert dữ liệu từ object thành dictionary
    var dictionary: [String: Any] {
        return (try? JSONSerialization.jsonObject(with: JSON.encoder.encode(self))) as? [String: Any] ?? [:]
    }
    subscript(key: String) -> Any? {
        return dictionary[key]
    }
    
}

struct Book: Codable {
    var name: String
    var author: String
    var description: String
    var publishedAt: String
}
