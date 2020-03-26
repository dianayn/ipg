//
//  SourceFeed.swift
//  newsFeedDemo
//
//  Created by Diana Duan on 26/3/20.
//  Copyright © 2020 diana. All rights reserved.
//

import Foundation

struct SourceFeed: Decodable {
    let status: String?
    let sources: [Source]

    var numberOfSources: Int {
        return sources.count
    }
}
