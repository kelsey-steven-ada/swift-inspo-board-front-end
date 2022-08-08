//
//  ContentView.swift
//  Shared
//
//  Created by Kelsey Steven on 8/3/22.
//

import SwiftUI

struct BoardsHomeView: View {
    var apiManager = InspoBoardAPIManager()
    @State var boards: [Board] = []
    
    
    init() {
        // Set color for the tab view badge
        // Relies on TabView using UITabBarItem, could break
        // if SwiftUI changes their implementation in the future
        UITabBarItem.appearance().badgeColor = .purple
    }
    
    var body: some View {
        if !boards.isEmpty {
            TabView {
                // First tab: Show board list
                VStack(spacing: 0) {
                    // List view of board info
                    BoardsList(boards: $boards)
                    
                    // Place color gradient behind the tab view.
                    // Screen orientation is locked to portrait in project
                    // settings since this implementation is fragile and
                    // will break in landscape mode.
                    Rectangle()
                        .fill(Color.clear)
                        .background(gradient)
                        .frame(height: 100)
                        .cornerRadius(20, corners: [.topLeft, .topRight])
                }
                .background(.clear)
                .edgesIgnoringSafeArea(.bottom)
                .badge(boards.count)
                .tabItem {
                    Label(
                        "Boards",
                        systemImage: "list.bullet"
                    )
                }
                
                // Second tab: Add board view
                VStack(spacing: 0) {
                    // Form for adding a new board
                    AddABoard()
                        .frame(maxHeight: .infinity)
                    
                    // Place color gradient behind the tab view.
                    // Screen orientation is locked to portrait in project
                    // settings since this implementation is fragile and
                    // will break in landscape mode.
                    Rectangle()
                        .fill(Color.clear)
                        .background(gradient)
                        .frame(height: 100)
                        .cornerRadius(20, corners: [.topLeft, .topRight])
                }
                .edgesIgnoringSafeArea(.bottom)
                .tabItem {
                    Label(
                        "Add Board",
                        systemImage: "text.badge.plus"
                    )
                }
            }
            .accentColor(Color("TabBlue"))
            .environmentObject(apiManager)
        } else {
            // If the array `boards` is empty, show a loading view
            // with a task that will load the board info from our API
            // through the `apiManager`
            LoadingView()
                .background(gradient)
                .task {
                    do {
                        boards = try await apiManager.getAllBoards()
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
