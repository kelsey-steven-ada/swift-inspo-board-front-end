//
//  BoardsList.swift
//  InspoBoard (iOS)
//
//  Created by Kelsey Steven on 8/3/22.
//

import SwiftUI

struct BoardsList: View {
    @Binding var boards: [Board]
    @State private var selectedBoard: Int? = nil
    @EnvironmentObject private var navigationManager: NavigationManager
    
    var body: some View {
        VStack {
            List(boards, id: \.id) { board in
//                NavigationLink (
//                    destination: CardsList(board: board),
//                    tag: board.id,
//                    selection: $selectedBoard,
//                    label: { BoardRow(board: board) }
//                )
                
                // Temp change to show updating state from child view BoardRow
                // Pass @State `boards` to each row which has a button that will
                // add a new entry to the `board` state when clicked
                BoardRow(board: board, boards: $boards)
            }
        }.onChange(of: navigationManager.activeTab) { newValue in
            selectedBoard = nil
        }
    }
}

struct BoardsList_Previews: PreviewProvider {
    static var previews: some View {
        BoardsList(boards: .constant(previewBoards))
    }
}
