//
//  Article.swift
//  newsFeedDemo
//
//  Created by Diana Duan on 26/3/20.
//  Copyright © 2020 diana. All rights reserved.
//

import Foundation

struct Article: Decodable {
    let title: String?
    let description: String?
    let urlToImage: String?
    let publishedAt: String
}
