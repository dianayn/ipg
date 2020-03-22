//
//  NewsCell.swift
//  newsFeedDemo
//
//  Created by Diana Duan on 20/3/20.
//  Copyright © 2020 diana. All rights reserved.
//

import UIKit

class NewsListCell: UITableViewCell {

    static let identifierNewsCell = "NewsListing"

    let newsTitleLabel: UILabel = {
        let newsTitle = UILabel()

        newsTitle.textColor = UIColor.white
        newsTitle.font = UIFont.boldSystemFont(ofSize: 16)
        newsTitle.translatesAutoresizingMaskIntoConstraints = false
        return newsTitle
    }()

    let stackView: UIStackView = {
        let stackView = UIStackView()

        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    let newsDescriptionLabel: UILabel = {
        let newsDescription = UILabel()

        newsDescription.textColor = UIColor.white
        newsDescription.font = UIFont.boldSystemFont(ofSize: 16)
        newsDescription.translatesAutoresizingMaskIntoConstraints = false
        return newsDescription
    }()

    let thumbNailImageView: UIImageView = {
        let thumbNailImage = UIImageView()

        thumbNailImage.translatesAutoresizingMaskIntoConstraints = false
        return thumbNailImage
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupView()

    }

    required init?(coder aDecoder: NSCoder ) {
        fatalError("init(coder: ) has not been implemented")
    }

    func setupView() {
        
        addSubview(thumbNailImageView)

        addSubview(stackView)
        stackView.addArrangedSubview(newsTitleLabel)
        stackView.addArrangedSubview(newsDescriptionLabel)


        NSLayoutConstraint.activate([

            thumbNailImageView.heightAnchor.constraint(equalTo: self.heightAnchor, constant: 50),
            thumbNailImageView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: 50),
            thumbNailImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),

            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 80),
//            stackView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: 60),
            stackView.leadingAnchor.constraint(equalTo: thumbNailImageView.trailingAnchor, constant: 5),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),

            newsTitleLabel.topAnchor.constraint(equalTo: stackView.topAnchor),
            newsTitleLabel.bottomAnchor.constraint(equalTo: newsDescriptionLabel.topAnchor, constant: 2),
            newsTitleLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 1),

            newsDescriptionLabel.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            newsDescriptionLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            newsDescriptionLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),

        ])
    }

    func configure(withArticles articles: Articles) {
        newsTitleLabel.text = articles.title
        newsDescriptionLabel.text = articles.description
        thumbNailImageView.image = articles.urlToImage
    }

    

}
