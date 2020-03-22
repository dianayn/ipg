import UIKit

class SourcesListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let fetchData = Network()
    let cellIdentifier = "SourcesListing"

    var sourcesList = [Sources]()

    let sourcesListTableView: UITableView = {
        let sources = UITableView()
        sources.backgroundColor = UIColor.white
        sources.separatorColor = UIColor.white
        sources.translatesAutoresizingMaskIntoConstraints = false
        return sources
        }()

    override func viewDidLoad() {
        super.viewDidLoad()

        sourcesListTableView.delegate = self
        sourcesListTableView.dataSource = self

        fetchData.downloadJSON(onSuccess: { sourcesList in

           self.sourcesList = sourcesList
           self.sourcesListTableView.reloadData()

        }, OnError: { error in
            print(error)
            return ()
        })


        setupTableView()

    }

    func setupTableView() {

        view.addSubview(sourcesListTableView)
        self.sourcesListTableView.register(SourcesListCell.self, forCellReuseIdentifier: cellIdentifier)

        NSLayoutConstraint.activate([
            sourcesListTableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            sourcesListTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            sourcesListTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            sourcesListTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
        ])
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return sourcesList.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 100
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let sourcesListCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! SourcesListCell
        sourcesListCell.backgroundColor = UIColor.orange

        sourcesListCell.configure(withSources: sourcesList[indexPath.row])

        return sourcesListCell
    }


//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let sourceNewsViewController = SourceNewsViewController()
//
//        let newsViewModel: NewsDetailsViewModel = listViewModel.newsViewModel(for: indexPath.row)
//
//        sourceNewsViewController.updateView(viewModel: newsViewModel)
//
//        present(sourceNewsViewController, animated: true, completion: nil)
//    }

//    func downloadJSON(onSuccess: @escaping ([Sources]) -> Void , OnError: @escaping (Error) -> Void) {
//
//        let url = URL(string: "https://newsapi.org/v2/sources?apiKey=757ac663ec054817a1c43701e5979d20") // 1
//
////        URLSessionDataTask: Use this task for GET requests to retrieve data from servers to memory.
//        let a = URLSession.shared.dataTask(with: url!) { (data, response, error) in // 2
//
////             Check error
//            if error == nil { // 3
//                do {
////                     Parse json
//                   let news = try JSONDecoder().decode(NewsFeed.self, from: data!).sources
//
////                     You can start doing the heavy lifting on a background queue and dispatch back to the main queue when you’re done.
//                    DispatchQueue.main.async {
//                        onSuccess(news)
//                    }
//                } catch {
//                    OnError(error)
//                }
//            } else {
//                OnError(error!)
//            }
//        }
//        a.resume()
//    }

}

