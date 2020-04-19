import UIKit
import Foundation

class SourceDetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    public var source: Source?

    private let fetchNews = FetchNews()
    private let cellIdentifier = "NewsListing"
    var articleList = [Article]()
    var requestId: String

   var navBar: UINavigationBar

    let articleListTableView: UITableView = {
           let article = UITableView()
           article.backgroundColor = UIColor.white
           article.separatorColor = UIColor.white
           article.translatesAutoresizingMaskIntoConstraints = false
           return article
           }()

    init(withID id: String) {
        self.requestId = id
        self.navBar = UINavigationBar()
        
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 44))
        let navItem = UINavigationItem(title: "Souce Details")
        let backButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelTapped))

        navItem.leftBarButtonItem = backButton
        navBar.setItems([navItem], animated: true)

        articleListTableView.delegate = self
        articleListTableView.dataSource = self

        // MARK: - need to pass the ID from here for the network call
        // netowkr.fetchNewsFromSource(id: source.id) { ... }

        fetchNews.downloadJSON(withID: requestId, onSuccess: { articlesList in

            self.articleList = articlesList
            self.articleListTableView.reloadData()

        }, OnError: { error in
            print(error)
            return ()
        })

        setupTableView()
    }

    func setupTableView() {
        view.addSubview(articleListTableView)
        view.addSubview(navBar)
        self.articleListTableView.register(NewsListCell.self, forCellReuseIdentifier: cellIdentifier)

        NSLayoutConstraint.activate([
            articleListTableView.topAnchor.constraint(equalTo: self.navBar.bottomAnchor),
            articleListTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            articleListTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            articleListTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
        ])
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return articleList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let articlesListCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! NewsListCell
        articlesListCell.backgroundColor = UIColor.orange

        let sourceDetailsViewModel = SourcesDetailsViewModel(article: articleList[indexPath.row])

        articlesListCell.configure(withArticle: sourceDetailsViewModel)
        return articlesListCell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let article: Article = articleList[indexPath.row]
        let detailsViewController = NewsDetailsViewController(withDetails: article)
        present(detailsViewController, animated: true, completion: nil)
    }

    @objc func cancelTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}
    



