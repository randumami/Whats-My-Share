//
//  QuotesViewModel.swift
//  Whats My Share
//
//  Created by Søren Randum on 05/09/2021.
//

import Foundation

class ViewModel : NSObject {

  var bindVMtoController : (() -> ()) = {}
    
  private var DataService : APIDataService!
  
  override init() {
      super.init()
      DataService = APIDataService()
      callFuncToGetQuoteData()
  }

  // indeholder data der skal vises i tableView
  var tableData : [TableData] = [] {
    didSet{
       self.bindVMtoController()
      
//      print("--------------")
//      print("Didset TableData: ")
//      print (tableData)
//      print("--------------")
    }
  }
 
  
  
  private(set) var quoteData : Quote!  {
            didSet {
              //self.bindVMtoController()
            }
        }
  

  
    func callFuncToGetQuoteData()  {
      for symb in portfolioArray {
        self.DataService.getSingleQuote ( symbol: symb.shareSymbol, completion: {(quoteData) in
          print("--------------")
          print("quoteData: ")
            print(portfolioArray)
         //   print(quoteData.price)
          print("--------------")
          self.tableData.append(TableData(Symbol: quoteData.symbol, Price: Double(quoteData.price) ?? 0))
          //self.tableData.insert(contentsOf: [quoteData[0].symbol, symb.sharesBought, "","" ], at: 0)
        } )
      
      }}
    
  
} // end of Class ViewModel


/* struct TableData 
let Symbol : String
let Price : Double // the shareprice gotten from the APIDataservice
let Units : Double // count af shares the user haves
let CurrencyConvert : Double // if foreign currency; factor to multiply the amount with
var Amount : Double // the moeny amount the user owns i the share
 */














class PortfolioViewModel {
  /* ***************************************************
   folioList indeholder listen over alle de aktier der ejes.
   gemmes på disk imellem brug og indlæses ved app start.
   
  listen gennemgåes (i en anden class) ved hver opstart, samt engang om dagen,
  samt når bruger fremtvinger en refresh
   
  ********************************************************/
  
  var folioList = [Portfolio]()
  
  init() {
  
  //TODO: indlæs portfolio fra disk - i Model??
  //TODO:
 }
  
//  func createNewShareToFiolioList(symbol: String, bought: String, amount: String, price: String) -> Void {
//
//    folioList.append(Portfolio(shareSymbol: symbol, shareDateBought: bought, sharesBought: amount, sharePrice: price))
//
//    print(folioList)
//  }
  
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

