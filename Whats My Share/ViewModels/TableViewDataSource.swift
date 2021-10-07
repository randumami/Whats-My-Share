//
//  TableViewDataSource.swift
//  Whats My Share
//
//  Created by Søren Randum on 05/09/2021.
//
//
/// Delegate and Datasource for ViewController

import Foundation
import UIKit

class TableViewDataSource : NSObject, UITableViewDataSource, UITableViewDelegate {
 
  var vModel = ViewModel()
    
  var strValue = Observer("")
  
  var amount = 0.0 {
    didSet {
      strValue.value  = "$ \(String(format: "%.2f",self.amount))"
    }
  }

  func updateTotalAmount(){
    amount = 0
    for i in 0..<vModel.tableData.count {
    amount = amount + vModel.tableData[i].Amount
    }
  }

  
  // create a cell for each table view row
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let cell = tableView.dequeueReusableCell(withIdentifier: "ShareCell", for: indexPath) as! ShareTableViewCell
    let share = vModel.tableData[indexPath.row]
   
    cell.symbolNameCell?.text = share.Symbol
    cell.latestTradingDayCell?.text = share.LatestTradingDay
    cell.sharePriceCell?.text = "$\(share.Price)"
    cell.amountCell.text = "$\(String(format: "%.2f",share.Amount))"
    
    cell.changePercentCell?.text = share.ChangePercent
    
    cell.changePercentCell.layer.masksToBounds = true
    cell.changePercentCell.layer.cornerRadius = 10
    cell.changePercentCell.sizeToFit()
    cell.changePercentCell.textAlignment = .center
    
    // color the label according to positive or negative
    if (share.ChangePercent.prefix(1) == "-") {
      cell.changePercentCell.backgroundColor = UIColor.red
    } else {
      cell.changePercentCell.backgroundColor = UIColor.green
    }
    
      // add border and color
      cell.backgroundColor = UIColor.white
      cell.layer.borderColor = UIColor.gray.cgColor
      cell.layer.borderWidth = 1
      cell.layer.cornerRadius = 8
      cell.clipsToBounds = true

      return cell
  }
  
  
  
  
  
func numberOfSections(in tableView: UITableView) -> Int {
   return 1
}

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  return vModel.tableData.count
}


  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("celle numer \(indexPath.row).")
 
   
     }
  
}
