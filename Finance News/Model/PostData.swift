//
//  PostData.swift
//  Finance News
//
//  Created by youngjun kim on 2021/04/15.
//

import Foundation

struct PostData: Codable {
    let articles: [Post]
}

struct Post: Codable, Identifiable {
    var id: String {
        return publishedAt
    }
    let title: String
    let url: String?
    let publishedAt: String
}
