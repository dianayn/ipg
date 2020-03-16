import XCTest

@testable import newsFeedDemo
class newsFeedDemoTests: XCTestCase {
    func testGivenSourcesWithNameThenSetTitleAsName() {
        let sources = Sources(name: "testTitle", description: "testDetail")
        let viewModel = NewsDetailsViewModel(sources: sources)

        XCTAssertEqual(viewModel.newsTitle, sources.name)
    }

    func testWhenSourcesHasNoNameShouldDisplayDefaultTitle() {
        let sources = Sources(name: nil, description: "testDetail")
        let viewModel = NewsDetailsViewModel(sources: sources)

        XCTAssertEqual(viewModel.newsTitle, "noTitleInString")
    }

}
