//
//  FleetTableViewCell.swift
//  iTrack
//
//  Created by DHAVAL PANDIT on 31/03/19.
//  Copyright © 2019 DHAVAL PANDIT. All rights reserved.
//

import UIKit

class FleetTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var registrationLabel: UILabel!
    @IBOutlet weak var engineNumberLabel: UILabel!
    @IBOutlet weak var chassisLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(_ fleet:Fleet?) {
        self.nameLabel.text = fleet?.name
        self.companyLabel.text = fleet?.company
        self.modelLabel.text = fleet?.fleet_model
        self.registrationLabel.text = fleet?.registration_number
        self.engineNumberLabel.text = fleet?.engine_number
        self.chassisLabel.text = fleet?.chassis_number
    }

}
