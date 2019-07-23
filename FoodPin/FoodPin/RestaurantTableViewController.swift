//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by Diana Duan on 4/7/19.
//  Copyright © 2019 diana. All rights reserved.
//

import UIKit
protocol Model {}

struct Restaurant: Model {
  let title: String
  let imageName: String
}

struct Ad: Model {
  let title: String
}

class RestaurantTableViewController: UITableViewController {
  var restaurantNames = ["Cafe Deadend","Homei","Teakha","Cafe loisl", "Petite Oyster","For Kee Restaurant","Po's Atelier","Bourke Street Bakery","Haigh's Chocolate", "Palomino Espresso","Upstate","Traif","Graham Avenue Meats", "Waffle & wolf", "Five Leaves","Cafe Lore", "Confessional", "Barrafina", "Donostia","Royal Oak", "CASK Pub and Kitchen"]

  var restaurantImages = ["cafedeadend","homei","teakha","cafeloisl","petiteoyster","forkeerestaurant","posatelier","bourkestreetbakery","haighschocolate","palominoespresso","upstate","traif","grahamavenuemeats","wafflewolf","fiveleaves","cafelore","confessional","barrafina","donostia","royaloak","caskpubkitchen"]

  var models: [Model] =
    [
      Restaurant(title: "Cafe Deadend", imageName: "cafedeadend"),
      Restaurant(title: "Teakha", imageName: "homei"),
      Restaurant(title: "Cafe loisl", imageName: "cafeloisl"),
      Ad(title: "coffee coupon"),
      Restaurant(title: "Cafe Deadend", imageName: "cafedeadend"),
      Restaurant(title: "Teakha", imageName: "homei"),
      Restaurant(title: "Cafe loisl", imageName: "cafeloisl"),
      Ad(title: "new supermarket"),
      Restaurant(title: "Cafe Deadend", imageName: "cafedeadend"),
      Restaurant(title: "Teakha", imageName: "homei"),
      Restaurant(title: "Cafe loisl", imageName: "cafeloisl"),
      Ad(title: "coffee coupon"),
      Restaurant(title: "Cafe Deadend", imageName: "cafedeadend"),
      Restaurant(title: "Teakha", imageName: "homei"),
      Restaurant(title: "Cafe loisl", imageName: "cafeloisl"),
      Ad(title: "new supermarket"),
    ]

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return models.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // Configure the cell...
      if let restaurant = models[indexPath.row] as? Restaurant {
        let cellIdentifier = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell
        cell.nameLabel?.text = restaurant.title
        cell.thumbnailImageView?.image = UIImage(named: restaurant.imageName)
        return cell
      } else if let ad = models[indexPath.row] as? Ad {
        let adscellIdentifier = "adscell"
        let adcell = tableView.dequeueReusableCell(withIdentifier: adscellIdentifier, for: indexPath) as! AdsTableViewCell
        adcell.nameLabel?.text = ad.title
        return adcell
      }
    return UITableViewCell()
  }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
