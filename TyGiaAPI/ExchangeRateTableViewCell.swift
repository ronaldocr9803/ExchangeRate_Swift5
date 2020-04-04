//
//  ExchangeRateTableViewCell.swift
//  TyGiaAPI
//
//  Created by ThangLai on 3/31/2 R.
//  Copyright © 2 Reiwa APPLE. All rights reserved.
//

import UIKit

class ExchangeRateTableViewCell: UITableViewCell {

    @IBOutlet weak var lblMa: UILabel!
    @IBOutlet weak var lblMua: UILabel!
    @IBOutlet weak var lblCk: UILabel!
    @IBOutlet weak var lblBan: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
