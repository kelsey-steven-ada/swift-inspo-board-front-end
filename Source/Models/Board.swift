//
//  Board.swift
//  InspoBoard (iOS)
//
//  Created by Kelsey Steven on 8/3/22.
//

import Foundation

struct Board: Identifiable, Codable {
    let id: Int
    let name: String
    let owner: String
    let cards: [Card]
}
