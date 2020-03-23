//
//  Network.swift
//  newsFeedDemo
//
//  Created by Diana Duan on 20/3/20.
//  Copyright © 2020 diana. All rights reserved.
//

import Foundation

class Network {

    var sourcesList = [Sources]()


    func downloadJSON(onSuccess: @escaping ([Sources]) -> Void , OnError: @escaping (Error) -> Void) -> [Sources] {

        let url = URL(string: "https://newsapi.org/v2/sources?apiKey=3b2ec6050fdf4c53b0500c4bfed546be")

        var request = URLRequest(url: url!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in

            if error == nil {
                do {
                    let sourcesList = try JSONDecoder().decode(SourcesFeed.self, from: data!).sources

                    DispatchQueue.main.async {
                        onSuccess(sourcesList)

                    }
                } catch {
                    OnError(error)
                }
            } else {
                OnError(error!)
            }
        }
        task.resume()
        return sourcesList
    }

    
}
