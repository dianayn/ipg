import Foundation
import UIKit

struct NewsDetailsViewModel {
    let newsTitle: String
    let newsDetails: String

    public init(sources: Sources) {
        newsTitle = sources.name ?? "noTitleInString"
        newsDetails = sources.description ?? "noDescriptionInString"
    }
}

struct NewsFeed: Decodable {
    let status: String?
    let sources: [Sources]
}

struct Sources: Decodable {
    let name: String?
    let description: String?
}

