//
//  QuoteTableViewDataSource.swift
//  Whats My Share
//
//  Created by Søren Randum on 05/09/2021.
//
//
//import Foundation
//import UIKit
////
//class TableViewDataSource <T>: NSObject, UITableViewDataSource {
////
////  var objects : [T]
////  
//  weak var tableView: TableViewDataSource!
////
////  init( objects : [T] ) {
////    //super.init()
////          //self.cellIdentifier = cellIdentifier
////          self.objects =  objects
////          //self.configureCell = configureCell
////
////  }
////
////  // MARK: - Table View
//func numberOfSections(in tableView: UITableView) -> Int {
//   return 1
//}
//
//func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
// return vModel.tableData.count
//}
//
//// create a cell for each table view row
//func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//  let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
//
//  cell.textLabel?.text = vModel.tableData[indexPath.row].Symbol
//
//    // add border and color
//    cell.backgroundColor = UIColor.white
//    cell.layer.borderColor = UIColor.blue.cgColor
//    cell.layer.borderWidth = 1
//    cell.layer.cornerRadius = 8
//
//    cell.clipsToBounds = true
//
//    return cell
//}
//
//func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//   if editingStyle == .delete {
//     vModel.tableData.remove(at: indexPath.row)
//       //objects.remove(at: indexPath.row)
//       tableView.deleteRows(at: [indexPath], with: .fade)
//   } else if editingStyle == .insert {
//       // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//   }
//}
//
//func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//  // Return false if you do not want the specified item to be editable.
//  return false
//}
//}
