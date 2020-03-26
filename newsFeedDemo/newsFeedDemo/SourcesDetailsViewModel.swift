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


    public init(article: Article) {
        articleDetailsTitle = article.title ?? "noTitle"
        articleDescription = article.description ?? "noDescription"
        articleImage = article.urlToImage ?? "noImage"
        articlePublishedAt = article.publishedAt 
    }
}




