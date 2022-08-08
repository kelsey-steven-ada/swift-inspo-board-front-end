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
        // Not recommended, relies on TabView using UITabBarItem
        UITabBarItem.appearance().badgeColor = .purple
    }
    
    var body: some View {
        if !boards.isEmpty {
            TabView {
                // First tab: Show board list
                VStack(spacing: 0) {
                    BoardsList(boards: $boards)
                    
                    Rectangle()
                        .fill(Color.clear)
                        .background(gradient)
                        .frame(height: 100)
                        .cornerRadius(20, corners: [.topLeft, .topRight])
                }
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
                    AddABoard()
                        .frame(maxHeight: .infinity)
                    
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
