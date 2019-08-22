//
//  PlayerDetailViewSection0TableViewCell.swift
//  NFL Draftipedia
//
//  Created by David Reyes on 7/25/19.
//  Copyright © 2019 David Reyes. All rights reserved.
//

import UIKit

class PlayerDetailViewSection0TableViewCell: UITableViewCell {
    
    @IBOutlet weak var playerNameLabel: UILabel!
    
    @IBOutlet weak var positionLabel: UILabel!
    
    @IBOutlet weak var teamLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
