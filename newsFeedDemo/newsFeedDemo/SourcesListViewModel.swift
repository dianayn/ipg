import Foundation
import UIKit

struct SourcesListViewModel {
//    let sourceID: String
    let sourceName: String
    let sourceDescription: String

    public init(sources: Source) {
        // MARK: - delete line 11 as id is not on screen
//        sourceID = sources.id ?? "noSourceID"
        sourceName = sources.name ?? "noSourceName"
        sourceDescription = sources.description ?? "noSourceDescription"    
    }
}


