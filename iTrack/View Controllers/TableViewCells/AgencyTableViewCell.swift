//
//  AgencyTableViewCell.swift
//  iTrack
//
//  Created by DHAVAL PANDIT on 31/03/19.
//  Copyright © 2019 DHAVAL PANDIT. All rights reserved.
//

import UIKit

class AgencyTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(_ agency: Agency?) {
        self.nameLabel.text = agency?.name
        self.addressLabel.text = agency?.address
    }

}
