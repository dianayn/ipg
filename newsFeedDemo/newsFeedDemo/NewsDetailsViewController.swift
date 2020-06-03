import Foundation
import UIKit

class NewsDetailsViewController: UIViewController {

    let details: Article

    var navBar: UINavigationBar

    init(withDetails articleDetails: Article) {
        self.details = articleDetails
        self.navBar = UINavigationBar()
        super.init(nibName: nil, bundle: nil)

        navBar = UINavigationBar(frame: .zero)
        let navItem = UINavigationItem(title: "Details")
        let backButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelTapped))
        
        navItem.leftBarButtonItem = backButton
        navBar.setItems([navItem], animated: true)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {

        let view = UIView()
        let viewModel = NewsDetailsViewModel(article: details)
        let articalDetailView = ArticleDetails()
        navBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(navBar)
        articalDetailView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(articalDetailView)

        NSLayoutConstraint.activate(
            [view.leftAnchor.constraint(equalTo: navBar.leftAnchor),
             view.rightAnchor.constraint(equalTo: navBar.rightAnchor),
             view.topAnchor.constraint(equalTo: navBar.topAnchor),

             articalDetailView.leftAnchor.constraint(equalTo: view.leftAnchor),
             articalDetailView.rightAnchor.constraint(equalTo: view.rightAnchor),
             articalDetailView.topAnchor.constraint(equalTo: navBar.bottomAnchor),
             articalDetailView.bottomAnchor.constraint(equalTo: view.bottomAnchor)]
        )

        articalDetailView.configure(withDetails: viewModel)
        
        view.backgroundColor = UIColor.white
        self.view = view
    }

    @objc func cancelTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}

