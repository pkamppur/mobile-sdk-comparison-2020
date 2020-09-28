//
//  GameDetails.swift
//  SwiftBoard
//
//  Created by Petteri Kamppuri on 28.9.2020.
//

import Foundation

struct GameDetails: Decodable {
    let name: String
    let id: String
    let thumbnailUrl: URL
    let imageUrl: URL
    let description: String
    let yearPublished: String
    let categories: [Link]
    let mechanisms: [Link]
    let designers: [Link]
    let artists: [Link]
    let expansions: [Link]
    let families: [Link]
    let implementations: [Link]
    let publishers: [Link]
    let playersMin: Int
    let playersMax: Int
    let playersBest: Int
    let playingTime: Int
    let playingTimeMin: Int
    let playingTimeMax: Int
}

struct Link: Decodable, Identifiable {
    let name: String
    let id: String
}
