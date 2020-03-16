import Foundation
import UIKit


class newsViewCell: UITableViewCell {

    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.orange
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let titleLabel: UILabel = {
        let title = UILabel()
//        title.text = "ABC NEWS"
        title.textColor = UIColor.white
        title.font = UIFont.boldSystemFont(ofSize: 16)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    let descriptionLabel: UILabel = {
        let description = UILabel()
//        description.text = "Your trusted source for breaking news,videos at ABCNews.com."
        description.textColor = UIColor.white
        description.font = UIFont.italicSystemFont(ofSize: 12)
        description.numberOfLines = 0
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupView()
    }

    required init?(coder aDecoder: NSCoder ) {
        fatalError("init(coder: ) has not been implemented")
    }

    func setupView() {
        addSubview(cellView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)

        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),

            titleLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -10),
            titleLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: 5),

            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -25),
            descriptionLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -10),

        ])
    }

    func configure(withNews sources: Sources) {
        titleLabel.text = sources.name
        descriptionLabel.text = sources.description
    }
}
