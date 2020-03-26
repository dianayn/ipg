import UIKit
import Foundation

class SourceDetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    public var source: Source?

    private let fetchNews = FetchNews()
    private let cellIdentifier = "NewsListing"
    var articleList = [Article]()
    var requestId: String

    let articleListTableView: UITableView = {
           let article = UITableView()
           article.backgroundColor = UIColor.white
           article.separatorColor = UIColor.white
           article.translatesAutoresizingMaskIntoConstraints = false
           return article
           }()

    init(withID id: String) {
        self.requestId = id
        super.init(nibName: nil, bundle: nil)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        print(source)

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
        self.articleListTableView.register(NewsListCell.self, forCellReuseIdentifier: cellIdentifier)

        NSLayoutConstraint.activate([
            articleListTableView.topAnchor.constraint(equalTo: self.view.topAnchor),
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

        let imageToURL = sourceDetailsViewModel.articleImage
        articlesListCell.configure(withArticle: sourceDetailsViewModel, imageURL: imageToURL)
        return articlesListCell
    }
}
    



