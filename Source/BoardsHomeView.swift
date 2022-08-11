//
//  ContentView.swift
//  Shared
//
//  Created by Kelsey Steven on 8/3/22.
//

import SwiftUI

struct BoardsHomeView: View {
    var apiManager = InspoBoardAPIManager()
    @State private var boards: [Board] = []
    @State private var dataFetchSuccessful = false
    
    
    var body: some View {
        // If fetching the data was successful, show home view
        if dataFetchSuccessful {
            BoardsTabView(boards: $boards)
                .environmentObject(apiManager) // Share apiManager with all views
            
        } else {
            // If the array `boards` is empty, show a loading view
            // with a task that will load the board info from our API
            // through the `apiManager`
            LoadingView()
                .background(gradient)
                .task {
                    do {
                        boards = try await apiManager.getAllBoards()
                        dataFetchSuccessful = true
                    } catch {
                        print("Error getting boards: \(error)")
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BoardsHomeView()
            .previewDevice(
                PreviewDevice(
                    rawValue: "iPhone 13"
                )
            )
            .previewDisplayName("iPhone 13")
    }
}
