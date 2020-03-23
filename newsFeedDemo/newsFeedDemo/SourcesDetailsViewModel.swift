//
//  SourcesDetailsViewModel.swift
//  newsFeedDemo
//
//  Created by Diana Duan on 20/3/20.
//  Copyright © 2020 diana. All rights reserved.
//

import Foundation

struct SourcesDetailsViewModel {
    let articleDetailsTitle: String
    let articleDescription: String
    let articleImage: String
    let articlePublishedAt: String


    public init(articles: Articles) {
        articleDetailsTitle = articles.title ?? "noTitle"
        articleDescription = articles.description ?? "noDescription"
        articleImage = articles.urlToImage ?? "noImage"
        articlePublishedAt = articles.publishedAt 
    }
}

struct SourcesDetailsFeed: Decodable {
    let status: String?
    let articles: [Articles]
}

struct Articles: Decodable {
    let title: String?
    let description: String?
    let urlToImage: String?
    let publishedAt: String
}
