import UIKit

class SourceListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private var news = [Sources]()

    let tableView: UITableView = {
        let news = UITableView()
        news.backgroundColor = UIColor.white
        news.separatorColor = UIColor.white
        news.translatesAutoresizingMaskIntoConstraints = false
        return news
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()

        tableView.delegate = self
        tableView.dataSource = self

        downloadJSON(onSuccess: {
            self.news = $0
            self.tableView.reloadData()
        }, OnError: { error in
            print(error)
            return ()
        })
    }

    func setupTableView() {
        tableView.register(newsViewCell.self, forCellReuseIdentifier: "cellId")

        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
        ])
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return news.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 100
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! newsViewCell
        cell.backgroundColor = UIColor.white

        let news = self.news[indexPath.row]
        cell.configure(withNews: news)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sourceNewsViewController = SourceNewsViewController()

        sourceNewsViewController.updateView(viewModel: NewsDetailsViewModel(sources: self.news[indexPath.row]))

        present(sourceNewsViewController, animated: true, completion: nil)
    }

    func downloadJSON(onSuccess: @escaping ([Sources]) -> Void , OnError: @escaping (Error) -> Void) {

        let url = URL(string: "https://newsapi.org/v2/sources?apiKey=757ac663ec054817a1c43701e5979d20") // 1

//        URLSessionDataTask: Use this task for GET requests to retrieve data from servers to memory.
        let a = URLSession.shared.dataTask(with: url!) { (data, response, error) in // 2

//             Check error
            if error == nil { // 3
                do {
//                     Parse json
                   let news = try JSONDecoder().decode(NewsFeed.self, from: data!).sources

//                     You can start doing the heavy lifting on a background queue and dispatch back to the main queue when you’re done.
                    DispatchQueue.main.async {
                        onSuccess(news)
                    }
                } catch {
                    OnError(error)
                }
            } else {
                OnError(error!)
            }
        }
        a.resume()
    }

}

