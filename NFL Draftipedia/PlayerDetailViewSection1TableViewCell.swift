//
//  PlayerDetailViewSection1TableViewCell.swift
//  NFL Draftipedia
//
//  Created by David Reyes on 7/23/19.
//  Copyright © 2019 David Reyes. All rights reserved.
//

import UIKit

class PlayerDetailViewSection1TableViewCell: UITableViewCell {

    @IBOutlet weak var draftYearLabel: UILabel!
    
    @IBOutlet weak var draftRoundLabel: UILabel!
    
    @IBOutlet weak var draftOverallPickLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
