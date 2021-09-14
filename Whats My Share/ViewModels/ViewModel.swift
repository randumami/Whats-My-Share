//
//  QuotesViewModel.swift
//  Whats My Share
//
//  Created by Søren Randum on 05/09/2021.
//

import Foundation

class ViewModel : NSObject {
    
    private var DataService : APIDataService!
    
    private(set) var quoteData : Response! {
            didSet {
                self.bindQuoteViewModelToController()
            }
        }
  
    var bindQuoteViewModelToController : (() -> ()) = {}

    
    override init() {
        super.init()
        self.DataService = APIDataService()
        callFuncToGetQuoteData()
    }
  
  
    func callFuncToGetQuoteData()  {
    // print ("i callFuncToGetQuoteData")
     // self.DataService.getSingleQuote {(quoteData) in print (quoteData) ; self.quoteData = quoteData  }
      
      self.DataService.getSingleQuote ( symbol: "AAPL", completion: {(quoteData) in print(quoteData.globalQuote.symbol,quoteData.globalQuote.latestTradingDay)
          self.quoteData = quoteData  } )
      
    }
    
  
}

class PortfolioViewModel {
  /* ***************************************************
   folioList indeholder listen over alle de aktier der ejes.
   gemmes på disk imellem brug og indlæses ved app start.
   
  listen gennemgåes (i en anden class) ved hver opstart, samt engang om dagen,
  samt når bruger fremtvinger en refresj
   
  ********************************************************/
  
  var folioList = [Portfolio]()
  
  init() {
  
  //TODO: indlæs portfolio fra disk - i Model??
  //TODO:
 }
  
  func createNewShareToFiolioList(symbol: String, bought: String, amount: String, price: String) -> Void {
    
    folioList.append(Portfolio(shareSymbol: symbol, shareDateBought: bought, sharesBought: amount, sharePrice: price))
    
    print(folioList)
  }
  
  func createTestData(){
    // MARK: only used for testing
    folioList.append(Portfolio(shareSymbol: "IBM", shareDateBought: "2020-02-03",
                               sharesBought: "22", sharePrice: "123"))
    folioList.append(Portfolio(shareSymbol: "APPL", shareDateBought: "2019-09-14",
                               sharesBought: "11", sharePrice: "149"))
    folioList.append(Portfolio(shareSymbol: "GM", shareDateBought: "2012-12-01",
                               sharesBought: "33", sharePrice: "12.3"))
    
    print(folioList)
    
  }
  
}

// Generic databinder variable
class DynamicVariable<T> {
  typealias Binding = (T) -> Void
  
  var value: T
     
  private var binder: Binding?
  
  init(_ value: T) {
    self.value = value
  }
  
  func bindAndFire(_ binder: @escaping Binding) {
    self.binder = binder
    binder(value)
  }
}

