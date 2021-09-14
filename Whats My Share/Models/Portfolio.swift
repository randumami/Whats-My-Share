//
//  Portfolio.swift
//  Whats My Share
//
//  Created by Søren Randum on 05/09/2021.
//

 import Foundation

var  portfolioArray = [Portfolio]() {
    didSet{
      print (portfolioArray)
      
    }
}

struct  Portfolio: Codable {
  let shareSymbol     : String
  let shareDateBought : String
  let sharesBought    : String
  let sharePrice      : String
  }


// kode til at gemme array af Struct.

let KeyForUserDefaults = "portfolio"

func write(_ array: [Portfolio]) throws {
  let url = getDocumentsDirectory().appendingPathComponent("portfolio.json")

    let data = try JSONEncoder().encode(array)
    try data.write(to: url)
}

func read() throws -> [Portfolio] {
  let url = getDocumentsDirectory().appendingPathComponent("portfolio.json")

    let data = try Data(contentsOf: url)
    return try JSONDecoder().decode([Portfolio].self, from: data)
}
//-------------------------------------------------------------------------------------------

//2. endelig noget der virker - gemmer det korrekt og henter det igen.
func storeInUserDefaults(){
  
  do {
      let data = try JSONEncoder().encode(portfolioArray)
      UserDefaults.standard.set(data, forKey: "Portfolio")
  } catch  {
      print(error)
  }
  
}

func fetchFromUserDefault(){
  if let data = UserDefaults.standard.data(forKey: "Portfolio") {
      do {
          let arr = try JSONDecoder().decode([Portfolio].self, from: data)
        portfolioArray = arr
          print(arr)
      } catch {
          print(error)
      }
  }
}



//-------------------------------------------------------------------------------------------
// 1. prøver denne først

func savePortfolio(){
  //(array as NSArray).writeToURL(fileUrl, atomically: true)
  let url = getDocumentsDirectory().appendingPathComponent("portfolio.json")
  
  if ((portfolioArray as NSArray).write(to: url, atomically: true)){print("succes")} else {print("fiasko")}
}

func loadPortfolio(){
  // // Read from file
  // let savedArray = NSArray(contentsOfURL: fileUrl) as! [[String]]
  let url = getDocumentsDirectory().appendingPathComponent("portfolio.json")
  
  //TODO: Her fejler, lav et check på fileExists
   // portfolioArray = [Portfolio]()
  if   ((try? url.checkResourceIsReachable()) ?? false) {
    portfolioArray = NSMutableArray(contentsOf: url) as! [Portfolio]
  } else { print("no file")}
}
//-------------------------------------------------------------------------------------------
func save(_ books: [Portfolio]) {
    let data = books.map { try? JSONEncoder().encode($0) }
    UserDefaults.standard.set(data, forKey: KeyForUserDefaults)
}

func load() -> [Portfolio] {
    guard let encodedData = UserDefaults.standard.array(forKey: KeyForUserDefaults) as? [Data] else {
        return []
    }

    return encodedData.map { try! JSONDecoder().decode(Portfolio.self, from: $0) }
}
//-------------------------------------------------------------------------------------------

func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}


/*
 Brug:
 
 save([Portfolio(shareSymbol: "APPL", sharesBought: "244"),
 Portfolio(shareSymbol: "IBM", sharesBought: "11")])

 let Portfolio = load()
 
 print(Portfolio) //[Book(shareSymbol: "APPL", sharesBought: "244"), Book(shareSymbol: "IBM", sharesBought: "11")]
 
 */
