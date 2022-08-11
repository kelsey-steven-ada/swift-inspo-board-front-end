//
//  BoardsTabView.swift
//  InspoBoard (iOS)
//
//  Created by Kelsey Steven on 8/8/22.
//

import SwiftUI

struct BoardsTabView: View {
    @StateObject private var navigationManager = NavigationManager()
    @Binding var boards: [Board]
    
    var body: some View {
        VStack {
            TabView(selection: $navigationManager.activeTab) {
                // First tab: Show board list or message that there are no boards
                NavigationView {
                    VStack {
                        if !boards.isEmpty {
                            BoardsList(boards: $boards)
                                .frame(maxHeight: .infinity)
                        } else {
                            NoBoardsView(boards: $boards)
                                .frame(maxHeight: .infinity)
                        }
                    }
                    .navigationBarTitle(Text("All Boards"), displayMode: .inline)
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
                .tag(0)
                
                // Second tab: Add board view
                NavigationView() {
                    AddABoard(boards: $boards)
                        .frame(maxHeight: .infinity)
                        .navigationBarTitle(Text("Add a Board"), displayMode: .inline)
                }
                .edgesIgnoringSafeArea(.bottom)
                .tabItem {
                    Label(
                        "Add Board",
                        systemImage: "text.badge.plus"
                    )
                }
                .tag(1)
            }
            .tabViewStyle(backgroundColor: .blue.opacity(0.3),
                          itemColor: .red.opacity(0.95),
                          selectedItemColor: Color("TabBlue"),
                          badgeColor: .purple)
        }
        .environmentObject(navigationManager)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct BoardsTabView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BoardsTabView(boards: .constant(previewBoards))
//            BoardsTabView(boards: .constant([]))
        }
    }
}
