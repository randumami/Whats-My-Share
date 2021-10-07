//
//  ViewController.swift
//  Whats My Share
//
//  Created by Søren Randum on 05/09/2021.
//

import UIKit

class ShareTableViewCell : UITableViewCell{
 
  @IBOutlet var symbolNameCell: UILabel!
  @IBOutlet var latestTradingDayCell: UILabel!
  @IBOutlet var sharePriceCell: UILabel!
  @IBOutlet var changePercentCell: UILabel!
  @IBOutlet var amountCell: UILabel!
}

class StartViewController: UIViewController
{
 // var vModel = ViewModel()
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var lblValue: UILabel!
  
 
  var dataSource = TableViewDataSource()
  
  override func viewDidLoad() {
    super.viewDidLoad()
  
    tableView.dataSource = dataSource
    tableView.delegate = dataSource
    tableView.refreshControl = UIRefreshControl()
    tableView.refreshControl?.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)

    dataSource.vModel.isUpdated.bindAndFire {[weak self] updated in
      if updated {
        self?.tableView.reloadData()
 
      }
    }
    
    dataSource.strValue.bind {[weak self] strVal in
      self?.lblValue.text = strVal
    }
    
  
//    vModel.callFuncToGetQuoteData()
//
//   tableView.reloadData()
//

  
   callToViewModelForUIUpdate()
   
  }

  @objc func pullToRefresh(){
    dataSource.vModel.callFuncToGetQuoteData()
 
    self.tableView.refreshControl?.endRefreshing()
  }
  
  
  func callToViewModelForUIUpdate(){
    dataSource.vModel.bindVMtoController = {
      DispatchQueue.main.async { [self] in
        self.tableView.reloadData()
        self.dataSource.updateTotalAmount()
      }
    }
  }

}

