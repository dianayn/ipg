//
//  RestaurantDetailsViewController.swift
//  FoodPinS
//
//  Created by Diana Duan on 7/8/19.
//  Copyright © 2019 diana. All rights reserved.
//

import UIKit

class RestaurantDetailsViewController: UIViewController {

  @IBOutlet var restaurantImageView: UIImageView!

  @IBOutlet var restaurantNameLabel: UILabel!
  @IBOutlet var restaurantTypeLabel: UILabel!
  @IBOutlet var restaurantLocationLabel: UILabel! 

  var restaurant = Restaurant(name: "", type: "", location: "", image: "", isVisited: false)

    override func viewDidLoad() {
        super.viewDidLoad()

      navigationItem.largeTitleDisplayMode = .never

      restaurantImageView.image = UIImage(named: restaurant.image)
      restaurantNameLabel.text = restaurant.name
      restaurantTypeLabel.text = restaurant.type
      restaurantLocationLabel.text = restaurant.location
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
