import UIKit
import Foundation

class SourceDetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private let fetchNews = FetchNews()
    private let cellIdentifier = "NewsListing"
    var articlesList = [Articles]()

    let articlesListTableView: UITableView = {
           let articles = UITableView()
           articles.backgroundColor = UIColor.white
           articles.separatorColor = UIColor.white
           articles.translatesAutoresizingMaskIntoConstraints = false
           return articles
           }()

    // MARK: - xCode is not happy when trying to inject a string
    init(withRequestID: String) {
        super.init()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        articlesListTableView.delegate = self
        articlesListTableView.dataSource = self

        // MARK: - need to pass the ID from here for the network call
        fetchNews.downloadJSON(onSuccess: { articlesList in

            self.articlesList = articlesList
            self.articlesListTableView.reloadData()

        }, OnError: { error in
            print(error)
            return ()
        })

        setupTableView()
        
    }

    func setupTableView() {
        view.addSubview(articlesListTableView)
        self.articlesListTableView.register(NewsListCell.self, forCellReuseIdentifier: cellIdentifier)

        NSLayoutConstraint.activate([
            articlesListTableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            articlesListTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            articlesListTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            articlesListTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
        ])
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return articlesList.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let articlesListCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! NewsListCell
        articlesListCell.backgroundColor = UIColor.orange

        let imageToURL = articlesList[indexPath.row].urlToImage
        articlesListCell.configure(withArticles: articlesList[indexPath.row], imageURL: imageToURL!)
        return articlesListCell
    }
}
    



