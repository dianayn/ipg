//
//  ArticleDetails.swift
//  newsFeedDemo
//
//  Created by Diana Duan on 28/3/20.
//  Copyright © 2020 diana. All rights reserved.
//

import Foundation
import UIKit

class ArticleDetails: UIView {

//    static let identifierDetails = "details"

    let stackView: UIStackView = {
        let stackView = UIStackView()

        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 3
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        return stackView
    }()

    let articelImage: UIImageView = {
        let image = UIImageView()

        image.contentMode = .scaleAspectFit
        image.sizeToFit()
        image.adjustsImageSizeForAccessibilityContentSizeCategory = false
        return image
    }()

    let articleTitle: UILabel = {
        let title = UILabel()

        title.font = UIFont.boldSystemFont(ofSize: 20)
        title.textColor = UIColor.black
        title.numberOfLines = 0
        title.text = "test title"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    let articleDetails: UILabel = {
        let details = UILabel()

        details.font = UIFont.boldSystemFont(ofSize: 20)
        details.textColor = UIColor.black
        details.numberOfLines = 0
        details.translatesAutoresizingMaskIntoConstraints = false
        return details
    }()

    public init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {

        self.addSubview(stackView)
        self.backgroundColor = UIColor.white
        stackView.addArrangedSubview(articelImage)
        stackView.addArrangedSubview(articleTitle)
        stackView.addArrangedSubview(articleDetails)

         NSLayoutConstraint.activate([

            stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),

        ])
        
    }

    func configure(withDetails newsDetails: NewsDetailsViewModel) {

        articleTitle.text = newsDetails.newsTitle
        articleDetails.text = newsDetails.newsDescription

        articelImage.kf.indicatorType = .activity
        articelImage.kf.setImage(with: URL(string: newsDetails.newsImage), placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil)
    }
}

