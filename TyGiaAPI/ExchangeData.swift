//
//  ExchangeModel.swift
//  TyGiaAPI
//
//  Created by ThangLai on 3/31/2 R.
//  Copyright © 2 Reiwa APPLE. All rights reserved.
//

import Foundation

struct ExchangeData: Codable {
    let items: [Items]
}

struct Items:Codable {
    let type: String
    let muatienmat: String
    let muack: String
    let bantienmat: String
}
