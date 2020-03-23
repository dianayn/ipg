//
//  FetchNews.swift
//  newsFeedDemo
//
//  Created by Diana Duan on 22/3/20.
//  Copyright © 2020 diana. All rights reserved.
//
import Foundation

class FetchNews {

    var articlesList = [Articles]()

    // MARK: - implementation task, Passing id in the request 

    func downloadJSON(onSuccess: @escaping ([Articles]) -> Void , OnError: @escaping (Error) -> Void) -> [Articles] {

        let url = URL(string: "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=3b2ec6050fdf4c53b0500c4bfed546be")

        var request = URLRequest(url: url!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in

            if error == nil {
                do {
                    let articlesList = try JSONDecoder().decode(SourcesDetailsFeed.self, from: data!).articles

                    DispatchQueue.main.async {
                        onSuccess(articlesList)
                    }
                } catch {
                    OnError(error)
                }
            } else {
                OnError(error!)
            }
        }
        task.resume()
        return articlesList
    }

}
