import UIKit
import Foundation

class SourceNewsViewController: UIViewController {

    private let newsTitleLabel = UILabel()
    private let newsDetailsLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white

        newsTitleLabel.font = .preferredFont(forTextStyle: .largeTitle)
        newsTitleLabel.textColor = .darkGray
        newsTitleLabel.textAlignment = .center

        newsDetailsLabel.font = .preferredFont(forTextStyle: .body)
        newsDetailsLabel.textColor = .darkText
        newsDetailsLabel.textAlignment = .center

        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 5
        view.addSubview(stackView)

        // what is the difference between addArrangedSubview and addSubview
        stackView.addArrangedSubview(newsTitleLabel)
        stackView.addArrangedSubview(newsDetailsLabel)

        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            newsTitleLabel.leftAnchor.constraint(equalTo: stackView.leftAnchor),
            newsTitleLabel.rightAnchor.constraint(equalTo: stackView.rightAnchor),
            newsTitleLabel.topAnchor.constraint(equalTo: stackView.topAnchor),

            newsDetailsLabel.leftAnchor.constraint(equalTo: stackView.leftAnchor),
            newsDetailsLabel.rightAnchor.constraint(equalTo: stackView.rightAnchor),
            newsDetailsLabel.topAnchor.constraint(equalTo: newsTitleLabel.bottomAnchor, constant: -2),
            newsDetailsLabel.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
        ])
    }

    func updateView(viewModel: NewsDetailsViewModel) {
        newsTitleLabel.text = viewModel.newsTitle
        newsDetailsLabel.text = viewModel.newsDetails
    }
}
    



