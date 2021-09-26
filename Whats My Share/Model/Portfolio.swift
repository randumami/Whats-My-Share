//
//  Portfolio.swift
//  Whats My Share
//
//  Created by Søren Randum on 05/09/2021.
//

 import Foundation
/**
 The Portfolio Struct contain a share owned by the user, all shares are contained in the
 portfolioarray. The array is persisted in Userdefaults.
 */
var  portfolioArray = [Portfolio]() {
    didSet{
      //print (portfolioArray) // debug print
    }
}

struct  Portfolio: Codable {
  let shareSymbol     : String
  let shareDateBought : String
  let sharesBought    : String
  let sharePrice      : String
  }


  let keyUsed = "WhatsMySharePortfolio"



func storeInUserDefaults(){
  do {
      let data = try JSONEncoder().encode(portfolioArray)
      UserDefaults.standard.set(data, forKey: keyUsed)
  } catch  {
      print(error)
  }
}

func fetchFromUserDefault(){
    if let data = UserDefaults.standard.data(forKey: keyUsed) {
      do {
          let arr = try JSONDecoder().decode([Portfolio].self, from: data)
        portfolioArray = arr
          print(arr)
      } catch {
          print(error)
      }
  }
}
