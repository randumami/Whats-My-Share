//
//  QuoteTableViewDataSource.swift
//  Whats My Share
//
//  Created by Søren Randum on 05/09/2021.
//

import Foundation
import UIKit

class QuoteTableViewDataSource: NSObject, UITableViewDataSource {
    
  var objects = [Any]()
  
  // MARK: - Table View
   func numberOfSections(in tableView: UITableView) -> Int {
      return 1
  }

   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return objects.count
  }

   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

      let object = objects[indexPath.row] as! NSDate
      cell.textLabel!.text = object.description
      return cell
  }

   func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
      // Return false if you do not want the specified item to be editable.
      return true
  }

  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
          objects.remove(at: indexPath.row)
          tableView.deleteRows(at: [indexPath], with: .fade)
      } else if editingStyle == .insert {
          // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
      }
  }
}
