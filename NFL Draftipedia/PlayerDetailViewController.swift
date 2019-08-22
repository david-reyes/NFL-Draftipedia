//
//  PlayerDetailViewController.swift
//  NFL Draftipedia
//
//  Created by David Reyes on 6/27/19.
//  Copyright © 2019 David Reyes. All rights reserved.
//

import UIKit

class PlayerDetailViewController: UIViewController {

    @IBOutlet weak var playerDetailTableView: UITableView!
    
    var player: PlayerValues!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(String(describing: player!.firstName))")
        
        playerDetailTableView.dataSource = self
        playerDetailTableView.delegate = self
    }
    
    
}

extension PlayerDetailViewController: UITableViewDataSource, UITableViewDelegate {

     func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == 0){
            let teamDictionary=TeamNameLookUp().teamDictionary
            guard let cellSection0 = tableView.dequeueReusableCell(withIdentifier: "Section0") as? PlayerDetailViewSection0TableViewCell else {
                return UITableViewCell()
            }
            cellSection0.playerNameLabel.text = player.firstName + " " + player.lastName
            cellSection0.positionLabel.text = player.nfl.position
            cellSection0.teamLabel.text = teamDictionary[player.nfl.team] ?? player.nfl.team
            return cellSection0
        }
        if (indexPath.section == 1) {
            guard let cellSection1 = tableView.dequeueReusableCell(withIdentifier: "Section1") as? PlayerDetailViewSection1TableViewCell else {
                return UITableViewCell()
            }
            //year
            cellSection1.draftYearLabel.text = String(player.draft.year)
            //draft
            cellSection1.draftRoundLabel.text = "Round: \(player.draft.round)"
            cellSection1.draftOverallPickLabel.text = "Overall Pick: \(player.draft.overallPick)"
            return cellSection1
        }
        
        if (indexPath.section == 2) {
            var formattedDOB: String
            let rawDOB = player.born ?? "DOB"
            print(rawDOB)
            let readDataFormatter = DateFormatter()
            readDataFormatter.locale = Locale(identifier: "en_US_POSIX")
            readDataFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.sssZ"
            readDataFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            if let dobDate=readDataFormatter.date(from: rawDOB) {
                print(dobDate )
                let dateFormatter = DateFormatter()
                dateFormatter.locale = Locale(identifier: "en_US_POSIX")
                dateFormatter.dateFormat = "MMMM d, yyyy"
                dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
                formattedDOB=dateFormatter.string(from: dobDate)
                print(formattedDOB)
            }
            else {
                formattedDOB = " "
            }
            guard let cellSection2 = tableView.dequeueReusableCell(withIdentifier: "Section2") as? PlayerDetailViewSection2TableViewCell else {
                return UITableViewCell()
            }
            cellSection2.bornLabel.text = "Born"
            cellSection2.bornDateLabel.text = formattedDOB
            cellSection2.bornTownLabel.text = (player.birthplace?.city ?? "Birth City") + ", " + (player.birthplace?.state ?? "Birth State")
            return cellSection2
        }
        if (indexPath.section == 3){
            guard let cellSection3 = tableView.dequeueReusableCell(withIdentifier: "Section3") as? PlayerDetailViewSection3TableViewCell else {
                return UITableViewCell()
            }
            
            cellSection3.highSchoolLabel.text = "High school"
            cellSection3.highSchoolCityLabel.text = (player.highSchool?.name ?? "High School")
            cellSection3.highSchoolStateLabel.text = (player.highSchool?.city ?? "High School City") + ", " + (player.highSchool?.state ?? "High School State")
            return cellSection3
        }
        if (indexPath.section == 4){
            guard let cellSection4 = tableView.dequeueReusableCell(withIdentifier: "Section4") as? PlayerDetailViewSection4TableViewCell else {
                return UITableViewCell()
            }
            cellSection4.collegeLabel.text = "College"
            cellSection4.collegeYearLabel.text = String(describing: player.draft.year)
            cellSection4.schoolNameLabel.text = player.college.team
            return cellSection4
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath){
        self.navigationController?.popToRootViewController(animated: true)
        /*
        if let searchViewController=self.navigationController?.topViewController as? SearchViewController {
            let selectionIndexPath=IndexPath(row: player.draft.overallPick-1, section: 0)
            searchViewController.tableView.scrollToRow(at: selectionIndexPath,
                                                       at: UITableView.ScrollPosition.middle,
                animated: true)
        }
 */
            
        
    }
}

