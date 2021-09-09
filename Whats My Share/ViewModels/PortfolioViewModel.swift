//
//  PortfolioViewModel.swift
//  Whats My Share
//
//  Created by Søren Randum on 09/09/2021.
//

import Foundation

class PortfolioViewModel: NSObject {
  var folioList = [Portfolio]()
  
  override init() {
     super.init()
  //TODO: indlæs portfolio fra disk
  //TODO:
 }
  
  func createNewShareToFiolioList(symbol: String, bought: String, amount: String, price: String) -> Void {
    
    // MARK: only used for testing
    folioList.append(Portfolio(shareSymbol: "IBM", shareDateBought: "2020-02-03",
                               sharesBought: "22", sharePrice: "123"))
    
    folioList.append(Portfolio(shareSymbol: symbol, shareDateBought: bought, sharesBought: amount, sharePrice: price))
    
    print(folioList)
    
    
  }
  
  
  
}
