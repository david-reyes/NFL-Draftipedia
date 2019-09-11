//
//  ViewController.swift
//  NFL Draftipedia
//
//  Created by David Reyes on 10/30/18.
//  Copyright © 2018 David Reyes. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    let searchController=UISearchController(searchResultsController: nil)
    struct TableViewCellIdentifiers {
        static let searchResultCell = "SearchResultCell"
        static let nothingFoundCell = "NothingFoundCell"
    }
    let draftData=DraftData()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        collectionView.delegate = self
        collectionView.dataSource = self
        var cellNib = UINib(nibName: TableViewCellIdentifiers.searchResultCell, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: TableViewCellIdentifiers.searchResultCell)
        cellNib = UINib(nibName: TableViewCellIdentifiers.nothingFoundCell, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: TableViewCellIdentifiers.nothingFoundCell)
        let collectionCellNib = UINib(nibName: "DraftYearCell", bundle: nil)
        collectionView.register(collectionCellNib, forCellWithReuseIdentifier: "DraftYearCell")
        let zeroIndexPath=IndexPath(row: 0, section: 0)
        collectionView.selectItem(at: zeroIndexPath, animated: false, scrollPosition: UICollectionView.ScrollPosition.bottom)
        searchController.searchResultsUpdater=self
        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchController
            navigationItem.hidesSearchBarWhenScrolling = false
        } else {
            navigationItem.titleView = searchController.searchBar
        }
        definesPresentationContext = true
        searchController.dimsBackgroundDuringPresentation = false
    }
    func isFiltering() -> Bool {
        return searchController.isActive
    }
    /*
     pseudocode
     closure
     property in SearchViewCell
     called by the IBAction
     defined in SearchViewController
     makes functionality of controller and model defined in a view con troller, not a view
     gives it access to properties in scope of SearchViewController
     dictionary
     segue
     cast to a subclass of ViewController
     pass to a property of that view controller
     present the view controller
     do setup for view controller
     */
    func updateYearsVisibility() {
        if isFiltering() {
            collectionView.isHidden=true
        } else {
            collectionView.isHidden=false
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PlayerDetailSegue" {
            if let playerDetailViewController = segue.destination as? PlayerDetailViewController {
                playerDetailViewController.player = draftData.selectedPlayer
            }
        }
    }
}
extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchText=searchController.searchBar.text ?? ""
        let lowerCasedSearchText=searchText.lowercased()
        draftData.filterPlayers(searchText: lowerCasedSearchText)
        updateYearsVisibility()
        tableView.reloadData()
    }
}
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? SearchResultCell {
            draftData.selectedPlayer = cell.player
        }
        performSegue(withIdentifier: "PlayerDetailSegue", sender: self)
        //TEST FEATURE: TURN THIS OFF TO TEST
        //tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return draftData.filteredPlayers.count
        } else {
            return draftData.selectedDraft?.NFLDraft.count ?? draftData.draftHistory[0].NFLDraft.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if draftData.draftHistory.count == 0 {
            return tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifiers.nothingFoundCell, for: indexPath)
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifiers.searchResultCell, for: indexPath) as? SearchResultCell else {
                return UITableViewCell()
            }
            var display=[Player]()
            if isFiltering() {
                display=draftData.filteredPlayers
            } else {
                display = draftData.selectedDraft?.NFLDraft ?? [Player]()
            }
            cell.player = display[indexPath.row].player
            cell.nameLabel.text = display[indexPath.row].player.firstName + " " + display[indexPath.row].player.lastName
            cell.schoolNameLabel.text = display[indexPath.row].player.college.position + "  " + display[indexPath.row].player.college.team
            cell.overallPickLabel.text = String(display[indexPath.row].player.draft.overallPick)
            cell.teamNameButton.setTitle(display[indexPath.row].player.nfl.team, for: UIControl.State.normal)
            cell.teamNameButton.tag=indexPath.row
            cell.delegate = self as? SearchResultCellDelegate
            cell.teamDraftSegue = {() -> Void in
                //will have gotten tag from sender in cell
                //will get team using tag as index for data model of UITableView
                //will perform some looping to get the data set of players from that year for that team
                //will segue
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                guard let vc = storyboard.instantiateViewController(withIdentifier: "TeamDraftViewController") as? TeamDraftViewController
                    else {
                        return
                }
                let player=display[indexPath.row].player!
                vc.teamDraft=self.draftData.teamDraftLookUp[player.draft.year]?[player.nfl.team] ??
                    [Player]()
                vc.teamName=self.draftData.teamNameLookup.teamDictionary[display[indexPath.row].player.nfl.team] ?? "Team Name"
                vc.year=display[indexPath.row].player.draft.year
                self.navigationController!.pushViewController(vc, animated: true)
            }
            return cell
        }
    }
}
extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return draftData.draftYear.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DraftYearCell", for: indexPath) as? DraftYearCell else {
            return UICollectionViewCell()
        }
        cell.draftYearLabel.text = String(draftData.draftYear[indexPath.row])
        return cell
    }
}
extension SearchViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        draftData.selectedDraft = draftData.draftHistory[indexPath.row]
        tableView.reloadData()
    }
}
