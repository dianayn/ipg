//
//  ViewController.swift
//  SimpleTable
//
//  Created by Diana Duan on 3/7/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  var restaurantNames = ["Cage Deadend", "Home1", "Teakha","Cafe Loisl","Petite oyster","For Kee Restaurant","PO's Atelier","Bourke Street Bakery", "Haigh's choclate","Traif","Palomino Espresso","Upstate","Graham Avenue Meats And Deli","Five Leaves","Cafe Lore","Confessional","Barrafina","Royal","CASK Pub and Kitchen"]

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return restaurantNames.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellIdentifier = "datacell"
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

    cell.textLabel?.text = restaurantNames[indexPath.row]
    cell.imageView?.image = UIImage(named: "restaurant")
    return cell
  }


  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  override var prefersStatusBarHidden: Bool {
    return true
  }

}

