import Foundation
import UIKit

struct NewDetailsViewModel {
    let sourceName: String
    let sourceDescription: String

    public init(sources: Sources) {
        sourceName = sources.name ?? "noTitleInString"
        sourceDescription = sources.description ?? "noDescriptionInString"
    }


    struct SourcesFeed: Decodable {
        let status: String?
        let sources: [Sources]
    }

    struct Sources: Decodable {
        let name: String?
        let description: String?
    }

}
