//
//  NFLDraft.swift
//  NFL Draftipedia
//
//  Created by David Reyes on 3/28/19.
//  Copyright © 2019 David Reyes. All rights reserved.
//
import Foundation
struct NFLDraftHistory: Decodable {
    let drafts: [NFLDraftYear]!
    enum CodingKeys: String, CodingKey {
        case drafts = "TOP"
    }
}
struct NFLDraftYear: Decodable {
    let NFLDraft: [Player]!
    let draftYear: Int!
    enum CodingKeys: String, CodingKey {
        case NFLDraft
        case draftYear = "draft_year"
    }
}
struct Player: Decodable {
    let player: PlayerValues!
    enum CodingKeys: String, CodingKey {
        case player
    }
}
struct PlayerValues: Decodable {
    let born: String?
    let firstName: String
    let middleName: String?
    let lastName: String
    let suffix: String?
    let birthplace: Birthplace?
    let highSchool: HighSchool?
    let college: College
    let draft: Draft
    let nfl: NFL
    enum CodingKeys: String, CodingKey {
        case born
        case firstName
        case middleName
        case lastName
        case suffix
        case birthplace
        case highSchool
        case college
        case draft
        case nfl = "NFL"
    }
}
struct Birthplace: Decodable {
    let city: String?
    let state: String?
    let country: String?
    enum CodingKeys: String, CodingKey {
        case city
        case state
        case country
    }
}
struct HighSchool: Decodable {
    let name: String?
    let city: String?
    let state: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case city
        case state
    }
}

struct College: Decodable {
    let secondSchool: String?
    let firstSchool: String?
    let team: String
    let position: String
    
    enum CodingKeys: String, CodingKey {
        case secondSchool
        case firstSchool
        case team
        case position
    }
}

struct Draft: Codable {
    let year: Int
    let round: Int
    let overallPick: Int
    
    enum CodingKeys: String, CodingKey {
        case year
        case round
        case overallPick
    }
}

struct NFL: Decodable {
    let team: String
    let position: String
    
    enum CodingKeys: String, CodingKey {
        case team
        case position
    }
}
