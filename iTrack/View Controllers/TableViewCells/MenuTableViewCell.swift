//
//  MenuTableViewCell.swift
//  iTrack
//
//  Created by Taneja-Mac on 24/04/19.
//  Copyright © 2019 DHAVAL PANDIT. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var menuLabel: UILabel!
    @IBOutlet weak var menuImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(menuCell: [String:Any]?) {
        self.menuLabel.text = menuCell?["name"] as? String
        self.menuImageView.image = UIImage(named: menuCell?["image"] as?  String ?? "")
    }

}
