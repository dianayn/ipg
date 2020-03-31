import Foundation
import UIKit

class NewsDetailsViewController: UIViewController {

    let details: Article

    init(withDetails articleDetails: Article) {
        self.details = articleDetails
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {

        let viewModel = NewsDetailsViewModel(article: details)

        let view = ArticleDetails()
        view.configure(withDetails: viewModel)
        
        view.backgroundColor = UIColor.white

        self.view = view

    }

}

