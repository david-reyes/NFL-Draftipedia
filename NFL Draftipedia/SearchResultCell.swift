//
//  SearchResultCell.swift
//  NFL Draftipedia
//
//  Created by David Reyes on 3/19/19.
//  Copyright © 2019 David Reyes. All rights reserved.
//

protocol SearchResultCellDelegate {
    func teamButtonPressed()
    func playerNamePressed()
}

import UIKit

class SearchResultCell: UITableViewCell {
    var player: PlayerValues?
    //var getTeamFunction: (() -> String)?
    var teamDraftSegue: (() -> Void)!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var schoolNameLabel: UILabel!
    @IBOutlet weak var overallPickLabel: UILabel!
    @IBOutlet weak var teamNameButton: UIButton!
    @IBAction func teamNameAction(_ sender: Any) {
        teamDraftSegue()
    }
    var delegate: SearchResultCellDelegate!
    override func awakeFromNib() {
        super.awakeFromNib()
//        let selectedView = UIView(frame: CGRect.zero)
//        selectedView.backgoundColor = UIColor(red: 20/255, green: 160/255, blue: 160/255, alpha: 0.5)
//        selectedBackgroundView = selectedView
    }

    @IBAction func teamButtonPressed(_ sender: Any) {
        delegate.teamButtonPressed()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
