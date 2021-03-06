//
//  SetupViewController.swift
//  Whats My Share
//
//  Created by Søren Randum on 09/09/2021.
//

import UIKit

class SetupViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {

  @IBOutlet weak var txtSymbol: UITextField!
  @IBOutlet weak var txtDateBought: UITextField!
  @IBOutlet weak var txtAmountBought: UITextField!
  @IBOutlet weak var txtSharePrice: UITextField!
  @IBOutlet weak var txtShareName: UITextField!
  
  
  @IBAction func btSave(_ sender: Any) {
  //her skal være validering af felter ikke er tommer
    if txtSymbol.text!.isEmpty {
      print ("den er tom")
      return
    }
    saveNewShareToPortfolio()
    storeInUserDefaults()
    clearFieldsInView()
  }
  

  @IBOutlet  var tableView: UITableView!

  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self
    
    //user to be able to move or delete a cell, and also tap on it to select
    tableView.allowsSelectionDuringEditing = true
    
    DispatchQueue.main.async { [self] in
      self.tableView.reloadData()
     }
    }
    

  func clearFieldsInView()  {
    for case let textField as UITextField in self.view.subviews {
        textField.text = ""
    }
  }
  
  func saveNewShareToPortfolio()  {
    // gemmer data fra de 4 felter i Struct Portfolio
    // men hvsi det skal mvvvm skal der opsættes Observer eller lignende
    
    // TODO: skal refactoreres 
    portfolioArray.append(Portfolio(shareSymbol: txtSymbol.text!,
                                    shareDateBought: txtDateBought.text!,
                                    sharesBought: txtAmountBought.text!,
                                    sharePrice: txtSharePrice.text!))
    
    DispatchQueue.main.async { [self] in
      self.tableView.reloadData()
     }
  }
  
  // MARK: - Table View
   func numberOfSections(in tableView: UITableView) -> Int {
      return 1
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return portfolioArray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
    cell.textLabel!.text = portfolioArray[indexPath.row].shareSymbol
    
    return cell
  }

   func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
      // Return false if you do not want the specified item to be editable.
      return true
  }

  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
            portfolioArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            storeInUserDefaults()
      } else if editingStyle == .insert {
          // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
      }
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  
}
