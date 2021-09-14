//
//  ViewController.swift
//  Whats My Share
//
//  Created by Søren Randum on 05/09/2021.
//

import UIKit

class ViewController: UIViewController {
  
  private var quotesViewModel : ViewModel!
  
 // private var dataSource = QuoteTableViewDataSource<T>()
  
 // var dataSource : Response?
  var objects = [Portfolio]()
  
  @IBOutlet weak var tableView: UITableView!
  
  @IBOutlet weak var lblValue: UILabel!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    callToViewModelForUIUpdate()
      
  }

  func callToViewModelForUIUpdate(){
          
    self.quotesViewModel =  ViewModel()
    self.quotesViewModel.bindQuoteViewModelToController = {
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
    
    
    
    
    // self.dataSource = self.quotesViewModel.quoteData
    DispatchQueue.main.async { [self] in
      lblValue.text = quotesViewModel.quoteData.globalQuote.symbol
      
    //      self.quoteTableView.dataSource = self.dataSource
    //      self.quoteTableView.reloadData()
     }
  }
  
  
  
  
  // MARK: - Table View
   func numberOfSections(in tableView: UITableView) -> Int {
      return 1
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return objects.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

    let object = objects[indexPath.row]
    cell.textLabel!.text = object.shareSymbol
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

