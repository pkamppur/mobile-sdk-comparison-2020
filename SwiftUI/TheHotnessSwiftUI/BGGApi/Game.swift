//
//  Game.swift
//  TheHotnessSwiftUI
//
//  Created by Petteri Kamppuri on 28.9.2020.
//

import Foundation

struct Game: Decodable {
    let name: String
    let id: String
    let rank: Int
    let thumbnailUrl: URL
    let yearPublished: String
}
