//
//  Currency.swift
//  Whats My Share
//
//  Created by Søren Randum on 05/09/2021.
//  DONE

 import Foundation

struct Currencies: Decodable {
  let status : String
  let data : [CurrencyData]
}

struct CurrencyData: Decodable {
  let id, fromCurrencyCode, fromCurrencyName, toCurrencyCode, toCurrencyName: String
  let exchangeRate : Double
  
  enum CodingKeys: String , CodingKey {
    case id
    case fromCurrencyCode = "1. From_Currency Code"
    case fromCurrencyName = "2. From_Currency Name"
    case toCurrencyCode   = "3. To_Currency Code"
    case toCurrencyName   = "4. To_Currency Name"
    case exchangeRate     = "5. Exchange Rate"
  }
  
  
  
}


/*
{
  https://www.alphavantage.co/query?function=CURRENCY_EXCHANGE_RATE&from_currency=USD&to_currency=JPY&apikey=demo


    "Realtime Currency Exchange Rate": {
        "1. From_Currency Code": "USD",
        "2. From_Currency Name": "United States Dollar",
        "3. To_Currency Code": "JPY",
        "4. To_Currency Name": "Japanese Yen",
        "5. Exchange Rate": "109.67000000",
        "6. Last Refreshed": "2021-09-05 09:59:50",
        "7. Time Zone": "UTC",
        "8. Bid Price": "109.66500000",
        "9. Ask Price": "109.67100000"
    }
}


*/
