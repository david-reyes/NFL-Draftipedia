//
//  TeamDraftTableViewCell.swift
//  NFL Draftipedia
//
//  Created by David Reyes on 8/1/19.
//  Copyright © 2019 David Reyes. All rights reserved.
//

import UIKit

class TeamDraftTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var draftYearLabel: UILabel!
    
    @IBOutlet weak var nflTeamLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
