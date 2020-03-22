//
//  NewsDetailsViewModel.swift
//  newsFeedDemo
//
//  Created by Diana Duan on 20/3/20.
//  Copyright © 2020 diana. All rights reserved.
//

import Foundation

class NewsDetailsViewModel {
    let newsTitle: String
    let newsDescription: String
    let newsImage: String

    init(articles: Articles) {
        self.newsTitle = articles.title ?? "noTitle"
        self.newsDescription = articles.description ?? "noDescription"
        self.newsImage = articles.urlToImage ?? "noImage"
    }

}
