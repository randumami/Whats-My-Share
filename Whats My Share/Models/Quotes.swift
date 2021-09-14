//
//  Quotes.swift
//  Whats My Share
//
//  Created by Søren Randum on 05/09/2021.
//  DONE

 import Foundation


// MARK: - Response
struct Response: Codable {
    let globalQuote: Quote
    
    enum CodingKeys: String, CodingKey {
        case globalQuote = "Global Quote"
    }
}

// MARK: - Quote
struct Quote: Codable {
    let symbol, open, high, low: String
    let price, volume, latestTradingDay, previousClose: String
    let change, changePercent: String
    
    enum CodingKeys: String, CodingKey {
        case symbol = "01. symbol"
        case open = "02. open"
        case high = "03. high"
        case low = "04. low"
        case price = "05. price"
        case volume = "06. volume"
        case latestTradingDay = "07. latest trading day"
        case previousClose = "08. previous close"
        case change = "09. change"
        case changePercent = "10. change percent"
    }
}

/*
 example answer from server:
 Quote Endpoint
 https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=IBM&apikey=demo
 {
     "Global Quote": {
         "01. symbol": "IBM",
         "02. open": "139.6500",
         "03. high": "139.7900",
         "04. low": "137.7614",
         "05. price": "138.0600",
         "06. volume": "3285363",
         "07. latest trading day": "2021-09-07",
         "08. previous close": "139.5800",
         "09. change": "-1.5200",
         "10. change percent": "-1.0890%"
     }
 }
 
 */

