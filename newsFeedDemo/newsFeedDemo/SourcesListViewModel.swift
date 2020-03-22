import Foundation
import UIKit

struct SourcesListViewModel {
    let sourceID: String
    let sourceName: String
    let sourceDescription: String

    public init(sources: Sources) {
        sourceID = sources.id ?? "noSourceID"
        sourceName = sources.name ?? "noSourceName"
        sourceDescription = sources.description ?? "noSourceDescription"    
    }
}

struct SourcesFeed: Decodable {
    let status: String?
    let sources: [Sources]

    var numberOfSources: Int {
        return sources.count
    }
}

struct Sources: Decodable {
    let id: String?
    let name: String?
    let description: String?
}
