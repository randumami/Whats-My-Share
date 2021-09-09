//
//  QuotesViewModel.swift
//  Whats My Share
//
//  Created by Søren Randum on 05/09/2021.
//

import Foundation

class QuotesViewModel : NSObject {
    
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
    print ("i callFuncToGetQuoteData")
     // self.DataService.getSingleQuote {(quoteData) in print (quoteData) ; self.quoteData = quoteData  }
      
      self.DataService.getSingleQuote ( symbol: "AAPL", completion: {(quoteData) in print(quoteData); self.quoteData = quoteData  } )
      
    }
    
}


