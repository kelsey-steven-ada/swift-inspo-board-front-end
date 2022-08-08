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
    
    // If the keys in the API are snake-case, we can provide
    // a CodingKeys enum that gives a mapping for any keys that
    // be different from the variable names listed above.
    //
    // Here, only boardID needs to be mapped to a different
    // name from the network response.
    enum CodingKeys: String, CodingKey {
        case id
        case boardID = "board_id"
        case likes
        case message
    }
}
