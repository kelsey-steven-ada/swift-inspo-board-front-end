//
//  Card.swift
//  InspoBoard (iOS)
//
//  Created by Kelsey Steven on 8/3/22.
//

import Foundation

struct Card: Identifiable, Codable {
    let id: Int
    let boardID: Int
    let likes: Int
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case boardID = "board_id"
        case likes
        case message
    }
}
