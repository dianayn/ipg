//
//  RestaurantTableViewCell.swift
//  FoodPinT
//
//  Created by Diana Duan on 29/7/19.
//  Copyright © 2019 diana. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {
  @IBOutlet var nameLabel: UILabel!
  @IBOutlet var locationLabel: UILabel!
  @IBOutlet var typeLabel: UILabel!
  @IBOutlet var thumbnailImageView: UIImageView! 

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
