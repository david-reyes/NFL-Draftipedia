//
//  TeamDraftViewController.swift
//  NFL Draftipedia
//
//  Created by David Reyes on 7/27/19.
//  Copyright © 2019 David Reyes. All rights reserved.
//

import UIKit

class TeamDraftViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var teamDraftTableView: UITableView!
    
    var teamDraft=[Player]()
    var teamName="Team Name"
    var year: Int=0
    var selectedPlayer: Player?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        teamDraftTableView.dataSource=self
        teamDraftTableView.delegate=self
        
        let cellNib = UINib(nibName: TableViewCellIdentifiers.searchResultCell, bundle: nil)
        teamDraftTableView.register(cellNib, forCellReuseIdentifier: TableViewCellIdentifiers.searchResultCell)
        teamDraftTableView.reloadData()
        print("the number of players drafted was: " + teamDraft.count.description)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamDraft.count+1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TeamDraftTableViewCell") as? TeamDraftTableViewCell else {
                return UITableViewCell()
            }
            cell.nflTeamLabel.text=teamName
            cell.draftYearLabel.text=String(year)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifiers.searchResultCell, for: indexPath) as? SearchResultCell else {
                return UITableViewCell()
            }
            cell.teamNameButton.isHidden=true
            let player=teamDraft[indexPath.row-1].player
            cell.nameLabel.text=(player?.firstName ?? "First Name") + " " + (player?.lastName ?? "Last Name")
            cell.overallPickLabel.text=String(player?.draft.overallPick ?? 0)
            cell.schoolNameLabel.text=(player?.nfl.position ?? "XX")+" "+(player?.college.team ?? "school")
            return cell
        }
    }
    struct TableViewCellIdentifiers {
        static let searchResultCell = "SearchResultCell"
        static let nothingFoundCell = "NothingFoundCell"
    }
    func tableView(_ tableView: UITableView,
                   willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.row==0{
            return nil
        }
        return indexPath
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            return
        }
        selectedPlayer=teamDraft[indexPath.row-1]
        performSegue(withIdentifier: "PlayerDetailSegueFromTeam", sender: self)
        //        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PlayerDetailSegueFromTeam" {
            if let playerDetailViewController = segue.destination as? PlayerDetailViewController {
                playerDetailViewController.player = selectedPlayer?.player
            }
        }
    }
}
