//
//  DriverTableViewCell.swift
//  iTrack
//
//  Created by DHAVAL PANDIT on 31/03/19.
//  Copyright © 2019 DHAVAL PANDIT. All rights reserved.
//

import UIKit

class DriverTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fleetLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setData(_ driver: User?) {
        self.nameLabel.text = driver?.name
        self.fleetLabel.text = driver?.fleet?.registration_number ?? "Not Assigned"
    }
}
