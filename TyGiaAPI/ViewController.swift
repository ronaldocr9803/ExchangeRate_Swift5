//
//  ViewController.swift
//  TyGiaAPI
//
//  Created by ThangLai on 3/31/2 R.
//  Copyright © 2 Reiwa APPLE. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class ViewController: UIViewController {
    
    @IBOutlet weak var tblView: UITableView!
    
    var arrayExchange = [ExchangeModel]()
    
    var exchangeManager = ExchangeManager()
//    let exchangeURL = "https://www.dongabank.com.vn/exchange/export?fbclid=IwAR0NFNjAEgZHnXkTS6UbWmJCfkQMCtP6yG-1sLzqq3aUGvUz5UDWHQhAu4Q"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblView.delegate = self
        tblView.dataSource = self
        exchangeManager.delegate = self
        
        exchangeManager.performRequest()
        
        tblView.register(UINib(nibName: "ExchangeRateHeaderTableViewCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "headerCell")
        tblView.register(UINib(nibName: "ExchangeRateTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
//        if let result = readData() {
//            if let data = result.data(using: .utf8) {
//                //print(data)
//                let decoder = JSONDecoder()
//                //var arrayExchange = [ExchangeModel]()
//
//                do {
//                    let decodedData = try decoder.decode(ExchangeData.self, from: data)
//                    print(decodedData.items.count)
//                    for i in 0..<decodedData.items.count {
//                        arrayExchange.append(ExchangeModel(type: decodedData.items[i].type, muatienmat: decodedData.items[i].muatienmat, muack: decodedData.items[i].muack, bantienmat: decodedData.items[i].bantienmat))
//                    }
//                } catch {
//                    print(error)
//                    //delegate?.didFailWithError(error: error)
//                    //return nil
//                }
//
//            }
//        }
        print(arrayExchange)
    }
    
    
}
extension ViewController: ExchangeManagerDelegate {
    func didUpdateExchange(_ exchangeManager: ExchangeManager, exchange: ExchangeModel) {
        arrayExchange.append(exchange)
    }
    
   
    
    
}

extension ViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayExchange.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ExchangeRateTableViewCell
        cell.lblMa.text = arrayExchange[indexPath.row].type
        cell.lblCk.text = arrayExchange[indexPath.row].muack
        cell.lblBan.text = arrayExchange[indexPath.row].bantienmat
        cell.lblMua.text = arrayExchange[indexPath.row].muatienmat
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tblView.dequeueReusableHeaderFooterView(withIdentifier: "headerCell") as! ExchangeRateHeaderTableViewCell
        return view
        
    }
    
    
}

func readData() -> String? {
    var contents = ""
    if let url = URL(string: "https://dongabank.com.vn/exchange/export") {
        do {
            contents = try String(contentsOf: url)
            let vowels: Set<Character> = ["(", ")"]
            contents.removeAll(where: { vowels.contains($0) })
        } catch {
            // contents could not be loaded
        }
    } else {
        // the URL was bad!
    }
    return contents
}

