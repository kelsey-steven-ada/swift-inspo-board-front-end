//
//  InspoBoardAPIManager.swift
//  InspoBoard (iOS)
//
//  Created by Kelsey Steven on 8/3/22.
//

import Foundation

class InspoBoardAPIManager: ObservableObject {
    let baseURL = "https://kelsey-c17-inspiration-board.herokuapp.com/"
    
    func getAllBoards() async throws -> [Board] {
        // Ensure the URL is valid
        guard let url = URL(
            string: "\(baseURL)boards")
        else {
            fatalError("Missing URL")
        }

        // Make the GET request
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        // Check the response was successful
        guard (response as? HTTPURLResponse)?.statusCode == 200
        else {
            fatalError("Error while fetching data")
        }
        
        // Transform the data from the network response
        // into an array of Board objects
        let decodedData = try JSONDecoder().decode(
            [Board].self,
            from: data
        )
        
        return decodedData
    }

    // TODO: Fill out as views are added
    func createABoard(name: String, owner:String) async throws -> Bool {
        
        return true
    }

    func deleteABoard(boardID: Int) {

    }

    func createACard(boardID: Int, message: String) {

    }
}
