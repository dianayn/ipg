import UIKit

class SourcesListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let fetchData = Network()
    let cellIdentifier = "SourcesListing"
    var sourcesList = [Source]()

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

        fetchData.downloadSources(onSuccess: { sourcesList in

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

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let sourcesListCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! SourcesListCell
        sourcesListCell.backgroundColor = UIColor.orange

        let viewModel = SourcesListViewModel(sources: sourcesList[indexPath.row])
        sourcesListCell.configure(withSources: viewModel)
        return sourcesListCell
    }

    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        let source = sourcesList[indexPath.row]

        let sourceId = source.id

        let sourceDetailsViewController = SourceDetailsViewController(withID: sourceId!)
        present(sourceDetailsViewController, animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

