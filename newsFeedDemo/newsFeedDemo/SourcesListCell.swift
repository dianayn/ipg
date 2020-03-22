//
//  SourcesCell.swift
//  newsFeedDemo
//
//  Created by Diana Duan on 20/3/20.
//  Copyright © 2020 diana. All rights reserved.
//

import UIKit

class SourcesListCell: UITableViewCell {

    static let reuseIdentifier = "SourcesListing"

        let sourceTitleLabel: UILabel = {
            let sourceTitle = UILabel()

            sourceTitle.textColor = UIColor.white
            sourceTitle.font = UIFont.boldSystemFont(ofSize: 16)
            sourceTitle.translatesAutoresizingMaskIntoConstraints = false
            return sourceTitle
        }()

        let sourceDetailsLabel: UILabel = {
            let sourceDetails = UILabel()

            sourceDetails.textColor = UIColor.white
            sourceDetails.font = UIFont.italicSystemFont(ofSize: 12)
            sourceDetails.numberOfLines = 0
            sourceDetails.translatesAutoresizingMaskIntoConstraints = false
            return sourceDetails
        }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupView()

    }

    required init?(coder aDecoder: NSCoder ) {
        fatalError("init(coder: ) has not been implemented")
    }

    func setupView() {
        addSubview(sourceTitleLabel)
        addSubview(sourceDetailsLabel)

        NSLayoutConstraint.activate([

            sourceTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            sourceTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            sourceTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            sourceTitleLabel.bottomAnchor.constraint(equalTo: sourceDetailsLabel.topAnchor, constant: 5),

            sourceDetailsLabel.topAnchor.constraint(equalTo: sourceTitleLabel.topAnchor, constant: 15),
            sourceDetailsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            sourceDetailsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            sourceDetailsLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),

        ])
    }

    func configure(withSources sources: Sources) {
        sourceTitleLabel.text = sources.name
        sourceDetailsLabel.text = sources.description
    }

}
