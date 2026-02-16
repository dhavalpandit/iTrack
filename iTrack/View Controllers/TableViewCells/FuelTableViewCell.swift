//
//  FuelTableViewCell.swift
//  iTrack
//
//  Created by Taneja-Mac on 16/04/19.
//  Copyright © 2019 DHAVAL PANDIT. All rights reserved.
//

import UIKit

class FuelTableViewCell: UITableViewCell {

    @IBOutlet weak var fleetNumber: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(_ fuel: Fuel?) {
        self.fleetNumber.text = fuel?.fleet?.registration_number
        self.amountLabel.text = "\(fuel?.amount ?? 0.00)"
        self.quantityLabel.text = "\(fuel?.quantity ?? 0.00) L"
    }
}
