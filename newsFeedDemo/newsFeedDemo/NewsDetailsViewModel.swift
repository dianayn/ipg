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

    init(article: Article) {
        self.newsTitle = article.title ?? "noTitle"
        self.newsDescription = article.description ?? "noDescription"
        self.newsImage = article.urlToImage ?? "noImage"
    }

}
