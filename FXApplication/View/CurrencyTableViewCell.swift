//
//  CurrencyTableViewCell.swift
//  FXApplication
//
//  Created by Aslıhan Gürkan on 1.02.2023.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {

    @IBOutlet weak var currencyText: UILabel!
    @IBOutlet weak var priceText: UILabel!
    @IBOutlet weak var priceSellText: UILabel!
    
    @IBOutlet weak var buyText: UILabel!
    @IBOutlet weak var sellText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
