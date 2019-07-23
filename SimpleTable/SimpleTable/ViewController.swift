//
//  ViewController.swift
//  SimpleTable
//
//  Created by Diana Duan on 3/7/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit

protocol Model {
}

struct Restaurant: Model {
  let title: String
  let imageName: String
}

struct Ad: Model {
  let title: String
}

//struct School: Model {}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  let models: [Model] =
  [
    Restaurant(title: "Sichuan", imageName: "restaurant"),
    Ad(title: "ads3"),
    Restaurant(title: "Yunan", imageName: "restaurant"),
    Ad(title: "ads1"),
    Restaurant(title: "Malaysian", imageName: "restaurant"),
    Ad(title: "ads2"),
  ]

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return models.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellIdentifier = "datacell"
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

    //Type checking and Typecasting
    if let restaurant = models[indexPath.row] as? Restaurant {
      cell.textLabel?.text = restaurant.title
      cell.imageView?.image = UIImage(named: restaurant.imageName)
    } else if let ad = models[indexPath.row] as? Ad {
      cell.textLabel?.text = ad.title
    }

    return cell
  }


}

