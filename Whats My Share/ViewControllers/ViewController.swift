//
//  ViewController.swift
//  Whats My Share
//
//  Created by Søren Randum on 05/09/2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate  {
  
  private var vModel : ViewModel!
  
 // private var dataSource = QuoteTableViewDataSource<T>()
  
 // var dataSource : Response?

  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var lblValue: UILabel!
  
  let cellSpacingHeight: CGFloat = 5
     
  
  override func viewDidLoad() {
    super.viewDidLoad()
    fetchFromUserDefault()
    
    tableView.dataSource = self
    tableView.delegate = self
    
    callToViewModelForUIUpdate()
    
//    DispatchQueue.main.async { [self] in
//      self.tableView.reloadData()
//     }
  }

  func callToViewModelForUIUpdate(){
          
    vModel =  ViewModel()
    vModel.bindVMtoController = {
              self.updateDataSource()
      
          }
      }

  func updateDataSource(){
    /*
    self.dataSource = QuoteTableViewDataSource(cellIdentifier: "QuoteTableViewCell", items: self.quotesViewModel.quoteData.globalQuote, configureCell: { (cell, evm) in
          cell.employeeIdLabel.text = evm.id
          cell.employeeNameLabel.text = evm.employeeName
      })
      */
    
    vModel.callFuncToGetQuoteData()
    
    
    // self.dataSource = self.quotesViewModel.quoteData
    DispatchQueue.main.async { [self] in
      lblValue.text = vModel.tableData[0].Symbol
      self.tableView.reloadData()
      
    //      self.quoteTableView.dataSource = self.dataSource
    //      self.quoteTableView.reloadData()
     }
  }

  // MARK: - Table View - UITableViewDataSource
   func numberOfSections(in tableView: UITableView) -> Int {
      return 1
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return vModel.tableData.count
  }

   // create a cell for each table view row
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
     let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
   
     cell.textLabel?.text = vModel.tableData[indexPath.row].Symbol
       
       // add border and color
       cell.backgroundColor = UIColor.white
       cell.layer.borderColor = UIColor.blue.cgColor
       cell.layer.borderWidth = 1
       cell.layer.cornerRadius = 8

       cell.clipsToBounds = true
       
       return cell
   }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
        vModel.tableData.remove(at: indexPath.row)
          //objects.remove(at: indexPath.row)
          tableView.deleteRows(at: [indexPath], with: .fade)
      } else if editingStyle == .insert {
          // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
      }
  }
  
  func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return false
 }
  
  // MARK: - Table View - UITableViewDelegate
   // method to run when table view cell is tapped
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // note that indexPath.section is used rather than indexPath.row
       print("You tapped cell number \(indexPath.row).")
   }
  


  
  

} //End

