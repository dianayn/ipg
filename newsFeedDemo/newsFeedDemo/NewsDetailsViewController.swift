import Foundation
import UIKit

class NewsDetailsViewController: UIViewController {

    let details: Article

    var navBar: UINavigationBar

    init(withDetails articleDetails: Article) {
        self.details = articleDetails
        self.navBar = UINavigationBar()
        super.init(nibName: nil, bundle: nil)

        navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 44))
        let navItem = UINavigationItem(title: "Details")
        let backButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelTapped))
        
        navItem.leftBarButtonItem = backButton
        navBar.setItems([navItem], animated: true)
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

    @objc func cancelTapped() {
        self.dismiss(animated: true, completion: nil)
    }

}

