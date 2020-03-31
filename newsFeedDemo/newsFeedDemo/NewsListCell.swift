//
//  NewsCell.swift
//  newsFeedDemo
//
//  Created by Diana Duan on 20/3/20.
//  Copyright © 2020 diana. All rights reserved.
//

import UIKit
import Kingfisher

class NewsListCell: UITableViewCell {

    static let identifierNewsCell = "NewsListing"

    let stackView: UIStackView = {
        let stackView = UIStackView()

        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.spacing = 3
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    let thumbNailImageView: UIImageView = {
        let thumbNailImage = UIImageView()

        thumbNailImage.contentMode = .scaleAspectFit
        thumbNailImage.sizeToFit()
        thumbNailImage.translatesAutoresizingMaskIntoConstraints = false
        return thumbNailImage
    }()

    let newsTitleLabel: UILabel = {
        let newsTitle = UILabel()

        newsTitle.textColor = UIColor.black
        newsTitle.font = UIFont.boldSystemFont(ofSize: 16)
        newsTitle.numberOfLines = 0
        newsTitle.translatesAutoresizingMaskIntoConstraints = false
        return newsTitle
    }()

    let newsDescriptionLabel: UILabel = {
        let newsDescription = UILabel()

        newsDescription.textColor = UIColor.black
        newsDescription.font = UIFont.italicSystemFont(ofSize: 12)
        newsDescription.numberOfLines = 2
        newsDescription.translatesAutoresizingMaskIntoConstraints = false
        return newsDescription
    }()

    let newsPublishedAtLabel: UILabel = {
        let newsPublishedAt = UILabel()

        newsPublishedAt.textColor = UIColor.black
        newsPublishedAt.font = UIFont.italicSystemFont(ofSize: 10)
        newsPublishedAt.numberOfLines = 1
        newsPublishedAt.translatesAutoresizingMaskIntoConstraints = false
        return newsPublishedAt
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupView()

    }

    required init?(coder aDecoder: NSCoder ) {
        fatalError("init(coder: ) has not been implemented")
    }

    func setupView() {
        
        contentView.addSubview(thumbNailImageView)
        contentView.addSubview(stackView)

        stackView.addArrangedSubview(newsTitleLabel)
        stackView.addArrangedSubview(newsPublishedAtLabel)
        stackView.addArrangedSubview(newsDescriptionLabel)

        NSLayoutConstraint.activate([

            // MARK: - thumbNailImageView is aligned with StackView horizontally, how to get them align properly
            // MARK: - in which scenario, using a fixed heightAnchor and widthAnchor is better
            // MARK: - labels in the stackView Vertically
            // MARK: - if creates a constraint between labels in the stackView, is stackView.spacing still needed?
            // MARK: - what is the best way to get the thumbnailImage

            // MARK: - autoresizing

            thumbNailImageView.heightAnchor.constraint(equalToConstant: 80),
            thumbNailImageView.widthAnchor.constraint(equalToConstant: 90),
            thumbNailImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2),
            thumbNailImageView.trailingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: -5),

            thumbNailImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

        ])
    }

    func configure(withArticle sourcesDetailsViewModel: SourcesDetailsViewModel) {
        newsTitleLabel.text = sourcesDetailsViewModel.articleDetailsTitle
        newsPublishedAtLabel.text = sourcesDetailsViewModel.articlePublishedAt
        newsDescriptionLabel.text = sourcesDetailsViewModel.articleDescription

        thumbNailImageView.kf.indicatorType = .activity
        thumbNailImageView.kf.setImage(with: URL(string: sourcesDetailsViewModel.articleImage), placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil)
    }

}
