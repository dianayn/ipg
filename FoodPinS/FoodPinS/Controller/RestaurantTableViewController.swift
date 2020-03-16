//
//  RestaurantTableViewController.swift
//  FoodPinS
//
//  Created by Diana Duan on 16/7/19.
//  Copyright © 2019 diana. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {

  var restaurants: [Restaurant] = [

    Restaurant(name: "Cafe Deadend", type: "Coffee & Tea shop", location: "Hong Kong", image: "cafedeadend", isVisited: false),

    Restaurant(name: "Teakha", type: "Cafe", location: "Hong Kong", image: "homei", isVisited: false),

    Restaurant(name: "Teakha", type: "Tea House", location: "Sydney", image: "teakha", isVisited: false),

    Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Shang Hai", image: "cafeloisl", isVisited: false),

    Restaurant(name: "Petite Oyster", type: "French", location: "Sydney", image: "petiteoyster", isVisited: false),

    Restaurant(name: "Cafe Deadend", type: "Coffee & Tea shop", location: "Hong Kong", image: "cafedeadend", isVisited: false),

    Restaurant(name: "Teakha", type: "Cafe", location: "Hong Kong", image: "homei", isVisited: false),

    Restaurant(name: "Teakha", type: "Tea House", location: "Sydney", image: "teakha", isVisited: false),

    Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Shang Hai", image: "cafeloisl", isVisited: false),

    Restaurant(name: "Petite Oyster", type: "French", location: "Sydney", image: "petiteoyster", isVisited: false),

    Restaurant(name: "Cafe Deadend", type: "Coffee & Tea shop", location: "Hong Kong", image: "cafedeadend", isVisited: false),

    Restaurant(name: "Teakha", type: "Cafe", location: "Hong Kong", image: "homei", isVisited: false),

    Restaurant(name: "Teakha", type: "Tea House", location: "Sydney", image: "teakha", isVisited: false),

    Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Shang Hai", image: "cafeloisl", isVisited: false),

    Restaurant(name: "Petite Oyster", type: "French", location: "Sydney", image: "petiteoyster", isVisited: false),

    Restaurant(name: "Cafe Deadend", type: "Coffee & Tea shop", location: "Hong Kong", image: "cafedeadend", isVisited: false),

    Restaurant(name: "Teakha", type: "Cafe", location: "Hong Kong", image: "homei", isVisited: false),

    Restaurant(name: "Teakha", type: "Tea House", location: "Sydney", image: "teakha", isVisited: false),

    Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Shang Hai", image: "cafeloisl", isVisited: false),

    Restaurant(name: "Petite Oyster", type: "French", location: "Sydney", image: "petiteoyster", isVisited: false)

  ]
//  var restaurantNames: [String] = ["Cafe Deadend","Homei","Teakha","Cafe loisl", "Petite Oyster","For Kee Restaurant","Po's Atelier","Bourke Street Bakery","Haigh's Chocolate", "Palomino Espresso","Cafe Deadend","Homei","Teakha","Cafe loisl", "Petite Oyster","For Kee Restaurant","Po's Atelier","Bourke Street Bakery","Haigh's Chocolate", "Palomino Espresso"]
//
//  var restaurantImages = ["cafedeadend","homei","teakha","cafeloisl","petiteoyster","forkeerestaurant","posatelier","bourkestreetbakery","haighschocolate","palominoespresso","cafedeadend","homei","teakha","cafeloisl","petiteoyster","forkeerestaurant","posatelier","bourkestreetbakery","haighschocolate","palominoespresso"]
//
//  var restaurantLocations =
//      ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney","Sydney","Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney","Sydney"]
//
//  var restaurantTypes = ["Coffee & Tea shop","Cafe", "Tea House","Austrian / Causual Drink", "French", "Bakery", "Chocolate","Cafe", "American / Seafood", "American","Coffee & Tea shop","Cafe", "Tea House","Austrian / Causual Drink", "French", "Bakery", "Chocolate","Cafe", "American / Seafood", "American"]
//
//  var restaurantIsVisited = Array(repeating: false, count: 20)

    override func viewDidLoad() {
        super.viewDidLoad()

      self.navigationController?.navigationBar.prefersLargeTitles = true

      tableView.cellLayoutMarginsFollowReadableWidth = true

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("***** TABLE VIEW IS CALCULATING NUMBER OF ROWS: \(restaurants.count)")
        return restaurants.count
    }

     // Replacement of tableView
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      print("***** TABLEVIEW IS ASKING FOR CELL AT INDEXP PATH \(indexPath.row)")

        let cellIdentifier = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell

      // Configure the cell ...
      cell.nameLabel.text = restaurants[indexPath.row].name
      cell.locationLabel.text = restaurants[indexPath.row].location
      cell.typeLabel.text = restaurants[indexPath.row].type
      cell.thumbnailImageView.image = UIImage(named: restaurants[indexPath.row].image)

//      if restaurantIsVisited[indexPath.row] {
//        cell.accessoryType = .checkmark
//      } else {
//        cell.accessoryType = .none
//      }

      cell.accessoryType = restaurants[indexPath.row].isVisited ? .checkmark : .none

      return cell
  }

//  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//
//    if editingStyle == .delete {
//      // Delete the row from the data source
//      restaurantNames.remove(at: indexPath.row)
//      restaurantLocations.remove(at: indexPath.row)
//      restaurantTypes.remove(at: indexPath.row)
//      restaurantIsVisited.remove(at: indexPath.row)
//      restaurantImages.remove(at: indexPath.row)
//    }

    // MARK: - Delete the row
    // Solution one
//    tableView.reloadData()

//    // Solution two
//    tableView.deleteRows(at: [indexPath], with: .fade)
//
//    print("Total item : \(restaurantNames.count)")
//    for name in restaurantNames {
//      print(name)
//    }
//  }

  // MARK: - TableView Delegate

  override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

    let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {
      (action, sourceview, completionHandler) in

      // Solution three - Delete the row from Data source
      self.restaurants.remove(at: indexPath.row)

      self.tableView.deleteRows(at: [indexPath], with: .fade)

      // Call completion handler to dismiss the action button
      completionHandler(true)
    }

    let adeleteAction = UIContextualAction(style: .normal, title: "aha") {
      (action, sourceview, completionHandler) in
      self.restaurants.remove(at: indexPath.row)
      self.tableView.deleteRows(at: [indexPath], with: .fade)

      completionHandler(true)
    }

    let shareAction = UIContextualAction(style: .normal, title: "Share") { (action, sourceView, completionHandler) in

      let defaultText = "Just Check in at" + self.restaurants[indexPath.row].name

      let activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)

      self.present(activityController, animated: true, completion: nil)
      completionHandler(true)
    }

    let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction,shareAction, adeleteAction])

    return swipeConfiguration
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    // MARK: - Create an option menu as an action sheet

    let optionMenu = UIAlertController(title: nil, message: "what do you want to do?", preferredStyle: .alert)

    if let popoverController = optionMenu.popoverPresentationController {
      if let cell = tableView.cellForRow(at: indexPath) {
        popoverController.sourceView = cell
        popoverController.sourceRect = cell.bounds
      }
    }

    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

    let callActionHandler = {(action: UIAlertAction!) -> Void in
      let alertMessage = UIAlertController(title: "Service unavailable", message: "Sorry. Please try again later", preferredStyle: .alert)

      alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
      self.present(alertMessage,animated: true, completion: nil)
    }

    let callAction = UIAlertAction(title: "Call"+"123-456\(indexPath.row)", style:.default, handler: callActionHandler)

    let checkInAction = UIAlertAction(title: "Check in", style: .default, handler: {(action: UIAlertAction!) -> Void in

      let cell = tableView.cellForRow(at: indexPath)
      cell?.accessoryType = .checkmark
      self.restaurants[indexPath.row].isVisited = true

      })

    let unCheckInAction = UIAlertAction(title: "Remove Check in", style: .default, handler: {(action: UIAlertAction!) -> Void in
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .none
        self.restaurants[indexPath.row].isVisited = true
    })

    optionMenu.addAction(checkInAction)
    optionMenu.addAction(callAction)
    optionMenu.addAction(cancelAction)
    optionMenu.addAction(unCheckInAction)

    present(optionMenu,animated: true, completion: nil)

    tableView.deselectRow(at: indexPath, animated: false)
  }

  // MARK: - Navigation

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showRestaurantDetail" {
      if let indexPath = tableView.indexPathForSelectedRow {
        let destinationController = segue.destination as!
           RestaurantDetailsViewController
        destinationController.restaurant = restaurants[indexPath.row]

      }
    }
  }
}
