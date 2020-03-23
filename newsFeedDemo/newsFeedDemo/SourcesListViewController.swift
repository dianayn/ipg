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

    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sourcesListCell = sourcesList[indexPath.row]
        let id = sourcesListCell.id
        let sourceDetailsViewController = SourceDetailsViewController()

       present(sourceDetailsViewController, animated: true, completion: nil)



    }

}

