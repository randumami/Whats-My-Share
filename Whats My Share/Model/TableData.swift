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
  var Symbol          : String
  var Price           : Double             // the shareprice gotten from the APIDataservice
  var Units           : Double = 0         // count af shares the user haves
  var CurrencyConvert : Double = 1.00      // if foreign currency; factor to multiply the amount with
  var Amount          : Double = 0         // the money amount the user owns i the share
  
  init(Symbol: String, Price: Double) {
    self.Symbol = Symbol
    self.Price = Price
    
    Units = {getUnitsFromPortFolio(symbol: Symbol)}()
    Amount = Units * Price
  }
  func getUnitsFromPortFolio(symbol : String)-> Double {
    return(12345)
  }
  
  
}
