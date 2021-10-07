//
//  TableData.swift
//  Whats My Share
//
//  Created by Søren Randum on 18/09/2021.
//

import Foundation
/**
 The TableData Struct contains the list shown in the first tableview. This struct is the place where the
 users portfolio is matched to the current prices of the share in question.
 */

struct TableData {
  var Symbol            : String              // The ticker symbol
  var Price             : Double              // the shareprice gotten from the APIDataservice
  var LatestTradingDay  : String              // the latest date we got informaiton from
  var ChangePercent     : String              // the chnage in price from previous tradingday
  var Units             : Double = 0          // count af shares the user haves
  var CurrencyConvert   : Double = 1.00       // if foreign currency; factor to multiply the amount with
  var Amount            : Double = 0          // the money amount the user owns i the share
  
  init(Symbol: String, Price: Double, LatestTradingDay : String, ChangePercent : String) {
    self.Symbol = Symbol
    self.Price = Price
    self.LatestTradingDay = LatestTradingDay
    self.ChangePercent = ChangePercent
        
    Units = {getUnitsFromPortFolio(symbol: Symbol)}()
    Amount = Units * Price
//    
    
  }
  //TODO: - Finish this method
  func getUnitsFromPortFolio(symbol : String)-> Double {
        for i in 0..<portfolioArray.count {
      if portfolioArray[i].shareSymbol.uppercased() == symbol {
          return Double(portfolioArray[i].sharesBought) ?? 0
      }
    }
    return 0
  }
  
  
}
