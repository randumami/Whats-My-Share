//
//  APIDataService.swift
//  Whats My Share
//
//  Created by Søren Randum on 05/09/2021.
//
/*
 using service from fra www.alphavantage.co
 up to 5 API requests per minute and 500 requests per day
 get a key here https://www.alphavantage.co/support/#api-key
 */

import Foundation

class APIDataService: NSObject {
  

  private let MakeCurrencyEchangeURL: (String, String) -> URL = { from, to in  URL(string:"https://www.alphavantage.co/query?function=CURRENCY_EXCHANGE_RATE&from_currency=\(from)&to_currency=\(to)&apikey=\(keys.api_advantage_key)")!
  }
 
  private let makeSingleQuoteURL: (String) -> URL = { symbol in
    return
      URL(string:"https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=\(symbol)&apikey=\(keys.api_advantage_key)")!
  }
  
  

  func getSingleQuote(symbol: String = "IBM", completion : @escaping (Response) -> () ) {
    print ("i APIDataService.getSingleQuote")
    let url = makeSingleQuoteURL(symbol)
    let task = URLSession.shared.dataTask(with: url ) { data, response, error in
      if let data = data {
        let jsonDecoder = JSONDecoder()
        do {
        let quoteData = try jsonDecoder.decode(Response.self, from: data)
        completion(quoteData)
        } catch {print(error)}
      }
    }
    task.resume()
  }
  
  func getCurrencyExchange(fromCurrency: String = "USD", ToCurrency: String = "DKK", completion : @escaping (Currencies) -> ()) {
   
    let url = MakeCurrencyEchangeURL(fromCurrency, ToCurrency)
    URLSession.shared.dataTask(with: url ) { data, response, error in
      if let data = data {
        
        let jsonDecoder = JSONDecoder()
        let currencyData = try! jsonDecoder.decode(Currencies.self, from: data)
  
        completion(currencyData)
      }
    }.resume()
  }
  
  
}
