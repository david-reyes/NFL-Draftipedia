//
//  DraftData.swift
//  NFL Draftipedia
//
//  Created by David Reyes on 8/19/19.
//  Copyright © 2019 David Reyes. All rights reserved.
//

import Foundation

class DraftData {
    var filteredPlayers = [Player]()
    var searchResults: [NFLDraftYear] = []
    var draftHistory: [NFLDraftYear] = []
    var allDrafts: [NFLDraftHistory] = []
    var draftYear: [Int] = [2019, 2018, 2017, 2016, 2015, 2014, 2013, 2012, 2011, 2010, 2009]
    var selectedDraft: NFLDraftYear?
    var selectedPlayer: PlayerValues?
    let teamNameLookup=TeamNameLookUp()
    var teamDraftLookUp: [Int: [String: [Player]]] = [:]
    var allPlayers=[Player]()
    init() {
        loadDraftData()
    }
    func loadDraftData() {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .formatted(DateFormatter.fullISO8601)
        guard let path = Bundle.main.path(forResource: "NFLDraft", ofType: "txt") else {print("\n**error with path variable")
            return}
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            let decodedNFLDraftHistory = try jsonDecoder.decode(NFLDraftHistory.self, from: data)
            for singleDraft in decodedNFLDraftHistory.drafts {
                draftHistory.append(singleDraft)
            }
            selectedDraft = draftHistory[0]
            makeAllPlayersArray()
        } catch {
            print("data error: \(error)")
        }
        teamDraftLookUp=teamNameLookup.teamDraftLookUp
        makeSelectionDictionary()
    }
    func makeAllPlayersArray() {
        for nflDraftYear in draftHistory {
            allPlayers+=nflDraftYear.NFLDraft
        }
    }
    /*
     Draft history has all drafts
     we need a year to then be divided up into teams
     We need to add to the dictionary a year that has the teams with all the players
     the teams can start outr empty
     */
    func makeSelectionDictionary() {
        for year in draftHistory {
            print(year.NFLDraft[0].player.draft.year)
            teamDraftLookUp[year.NFLDraft[0].player.draft.year]=teamNameLookup.makeTeamLookUp()
            for player in year.NFLDraft {
                teamDraftLookUp[year.NFLDraft[0].player.draft.year]?[player.player.nfl.team]?.append(player)
            }
        }
    }
    func filterPlayers(searchText: String) {
        filteredPlayers=allPlayers.filter({ (entry: Player) -> Bool in
            let playerEntry=entry.player
            let fullName=(playerEntry?.firstName.lowercased() ?? "") + " " + (playerEntry?.lastName.lowercased() ?? "")
            return fullName.lowercased().contains(searchText)
        })
    }
}
extension DateFormatter {
    static let fullISO8601: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm.ss.SSSZ"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter .timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
}
