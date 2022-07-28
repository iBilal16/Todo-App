//
//  BuyListCell.swift
//  Todo App
//
//  Created by Bilal Ahmad on 28/07/2022.
//

import UIKit

class BuyListCell: UITableViewCell {
    
    @IBOutlet weak var nameTxtLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var priceTxtLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var qtyTxtLabel: UILabel!
    @IBOutlet weak var qtyLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
