//
//  TeamDictionary.swift
//  NFL Draftipedia
//
//  Created by David Reyes on 7/27/19.
//  Copyright © 2019 David Reyes. All rights reserved.
//

import Foundation

class TeamNameLookUp {
    var teamDictionary: [String: String] = [:]
    var teamDraftLookUp: [Int: [String: [Player]]]=[Int: [String: [Player]]]()
    init() {
        makeTeamDictionary()
//        makeTeamLookUp()
    }
    func makeTeamDictionary() {
        teamDictionary["AZ"] = "Arizona Cardinals"
        teamDictionary["ATL"] = "Atlanta Falcons"
        teamDictionary["BAL"] = "Baltimore Ravens"
        teamDictionary["BUF"] = "Buffalo Bills"
        teamDictionary["CAR"] = "Carolina Panthers"
        teamDictionary["CHI"] = "Chicago Bears"
        teamDictionary["CIN"] = "Cincinnati Bengals"
        teamDictionary["CLE"] = "Cleveland Browns"
        teamDictionary["DAL"] = "Dallas Cowboys"
        teamDictionary["DEN"] = "Denver Broncos"
        teamDictionary["DET"] = "Detroit Lions"
        teamDictionary["GB"] = "Green Bay Packers"
        teamDictionary["HOU"] = "Houston Texans"
        teamDictionary["IND"] = "Indianapolis Colts"
        teamDictionary["JAC"] = "Jacksonville Jaguars"
        teamDictionary["KC"] = "Kansas City Chiefs"
        teamDictionary["LAC"] = "Los Angeles Chargers"
        teamDictionary["LAR"] = "Los Angeles Rams"
        teamDictionary["MIA"] = "Miami Dolphins"
        teamDictionary["MIN"] = "Minnesota Vikings"
        teamDictionary["NE"] = "New England Patriots"
        teamDictionary["NO"] = "New Orleans Saints"
        teamDictionary["NYG"] = "New York Giants"
        teamDictionary["NYJ"] = "New York Jets"
        teamDictionary["OAK"] = "Oakland Raiders"
        teamDictionary["PHI"] = "Philadelphia Eagles"
        teamDictionary["PIT"] = "Pittsburgh Steelers"
        teamDictionary["SF"] = "San Francisco 49ers"
        teamDictionary["SEA"] = "Seattle Seahawks"
        teamDictionary["TB"] = "Tampa Bay Buccaneers"
        teamDictionary["TEN"] = "Tennessee Titans"
        teamDictionary["WAS"] = "Washington Redskins"
//Legacy Teams
        teamDictionary["STL"] = "St. Louis Rams"
        teamDictionary["SD"] = "San Diego Chargers"
        teamDictionary["RAI"] = "Los Angeles Raiders"
    }
    func makeTeamLookUp() -> [String: [Player]] {
        var teamDraftLookUp=[String: [Player]]()
        teamDraftLookUp["AZ"] = [Player]()
        teamDraftLookUp["ATL"] = [Player]()
        teamDraftLookUp["BAL"] = [Player]()
        teamDraftLookUp["BUF"] = [Player]()
        teamDraftLookUp["CAR"] = [Player]()
        teamDraftLookUp["CHI"] = [Player]()
        teamDraftLookUp["CIN"] = [Player]()
        teamDraftLookUp["CLE"] = [Player]()
        teamDraftLookUp["DAL"] = [Player]()
        teamDraftLookUp["DEN"] = [Player]()
        teamDraftLookUp["DET"] = [Player]()
        teamDraftLookUp["GB"] = [Player]()
        teamDraftLookUp["HOU"] = [Player]()
        teamDraftLookUp["IND"] = [Player]()
        teamDraftLookUp["JAC"] = [Player]()
        teamDraftLookUp["KC"] = [Player]()
        teamDraftLookUp["LAC"] = [Player]()
        teamDraftLookUp["LAR"] = [Player]()
        teamDraftLookUp["MIA"] = [Player]()
        teamDraftLookUp["MIN"] = [Player]()
        teamDraftLookUp["NE"] = [Player]()
        teamDraftLookUp["NO"] = [Player]()
        teamDraftLookUp["NYG"] = [Player]()
        teamDraftLookUp["NYJ"] = [Player]()
        teamDraftLookUp["OAK"] = [Player]()
        teamDraftLookUp["PHI"] = [Player]()
        teamDraftLookUp["PIT"] = [Player]()
        teamDraftLookUp["SF"] = [Player]()
        teamDraftLookUp["SEA"] = [Player]()
        teamDraftLookUp["TB"] = [Player]()
        teamDraftLookUp["TEN"] = [Player]()
        teamDraftLookUp["WAS"] = [Player]()
        teamDraftLookUp["STL"] = [Player]()
        teamDraftLookUp["SD"] = [Player]()
        teamDraftLookUp["RAI"] = [Player]()
        return teamDraftLookUp

    }
}
