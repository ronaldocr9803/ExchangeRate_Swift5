//
//  ExchangeManager.swift
//  TyGiaAPI
//
//  Created by ThangLai on 3/31/2 R.
//  Copyright © 2 Reiwa APPLE. All rights reserved.
//

import Foundation
import UIKit
protocol ExchangeManagerDelegate {
    func didUpdateExchange(_ exchangeManager:ExchangeManager, exchange: ExchangeModel)
    //func didFailWithError(error: Error)
}
struct ExchangeManager {
   
    var delegate: ExchangeManagerDelegate?
        
    func performRequest(/*with urlString: String*/) {
        var contents = ""
        if let url = URL(string: "https://dongabank.com.vn/exchange/export") {
            do {
                contents = try String(contentsOf: url)
                let vowels: Set<Character> = ["(", ")"]
                contents.removeAll(where: { vowels.contains($0) })
            } catch {
                // contents could not be loaded
            }
            if let data = contents.data(using: .utf8) {
                //print(data)
                let decoder = JSONDecoder()
                //var arrayExchange = [ExchangeModel]()
                
                do {
                    let decodedData = try decoder.decode(ExchangeData.self, from: data)
                    print(decodedData.items.count)
                    for i in 0..<decodedData.items.count {
                        print(decodedData.items[i].type)
                        delegate?.didUpdateExchange(self, exchange: ExchangeModel(type: decodedData.items[i].type, muatienmat: decodedData.items[i].muatienmat, muack: decodedData.items[i].muack, bantienmat: decodedData.items[i].bantienmat))
                    }
                } catch {
                    print(error)
                    //delegate?.didFailWithError(error: error)
                    //return nil
                }
                
            }
            
        } else {
            // the URL was bad!
        }
        
        
        //        if let url = URL(string: exchangeURL) {
        //            //2. Create URL session
        //            var request = URLRequest(url: url)
        //            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")  // the request is JSON
        //
        //            //let session = URLSession(configuration: .default)
        //
        //            //3. Give the session a task
        //            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        //                if error != nil {
        //                    //self.delegate?.didFailWithError(error: error!)
        //                    print(error!)
        //                    return // exit out of the function and don't continue
        //                }
        //
        //                if let safeData = data {
        //                    print(type(of: safeData))
        //
        //                    let decoder = JSONDecoder()
        //                    var arrayExchange = [ExchangeModel]()
        //
        //                    do {
        //                        let decodedData = try decoder.decode(ExchangeData.self, from: safeData)
        //                        print(decodedData.items.count)
        //                        for i in 0..<decodedData.items.count {
        //                            arrayExchange.append(ExchangeModel(type: decodedData.items[i].type, muatienmat: decodedData.items[i].muatienmat, muack: decodedData.items[i].muack, bantienmat: decodedData.items[i].bantienmat))
        //                        }
        //                        self.delegate?.didUpdateExchange(self, weather: arrayExchange)
        //                    } catch {
        //                        print(error)
        //                        //delegate?.didFailWithError(error: error)
        //                        //return nil
        //                    }
        //                }
        //
        //            }
        //            //4. Start the task
        //            task.resume()
        //        } else {
        //            fatalError()
        //        }
        
    }

}
