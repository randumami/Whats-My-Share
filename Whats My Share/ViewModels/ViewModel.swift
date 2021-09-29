//
//  QuotesViewModel.swift
//  Whats My Share
//
//  Created by Søren Randum on 05/09/2021.
//

import Foundation

class ViewModel : NSObject {

  var bindVMtoController : (() -> ()) = {}
  
  lazy var isUpdated = Observer(false)
  
  private var dataService : APIDataService!
  
  override init() {
    super.init()
    dataService = APIDataService()
    callFuncToGetQuoteData()
  }
 
  var tableData : [TableData] = [] {
    didSet{
       self.bindVMtoController()
    }
  }
  
  private(set) var quoteData : Quote!

  
    func callFuncToGetQuoteData()  {
      self.tableData.removeAll()
      for symb in portfolioArray {
        self.dataService.getSingleQuote ( symbol: symb.shareSymbol, completion: {(quoteData) in
          self.tableData.append(TableData(Symbol: quoteData.symbol,
                                          Price: Double(quoteData.price) ?? 0,
                                          LatestTradingDay: quoteData.latestTradingDay,
                                          ChangePercent: quoteData.changePercent))
        })
    }
    isUpdated.value = true
  }
}

class Observer<T> {
    typealias Listener = (T) -> Void
  
    var listener: Listener?
    var value: T {
        didSet {
            listener?(value)
        }
    }

    init(_ value: T) {
        self.value = value
    }

    func bind(listener: Listener?) {
        self.listener = listener
    }
    
    func bindAndFire(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}
