//
//  BoardRow.swift
//  InspoBoard (iOS)
//
//  Created by Kelsey Steven on 8/3/22.
//

import SwiftUI

struct BoardRow: View {
    var board: Board
    @Binding var boards: [Board]

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(board.name)
                    .bold()
                    .font(.title)
                
                Text(board.owner)
                    .font(.caption)
            }
            
            Spacer()
            
            Text("Card(s): \(board.cards.count)")
            
            Spacer()
            
            // Temp change to show updating parent's state from a child view
            Button {
                // Create the new board to add
                let newBoard = Board(id: 10, name: "Fake Board", owner: "Nobody", cards: [])
                var newBoardsList = boards      // Create a copy of the old data
                newBoardsList.append(newBoard)  // Make updates on the new list
                boards = newBoardsList          // Update the binding to the new list
            } label: {
                Text("Add Board")
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }
}

struct BoardRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
//            BoardRow(board: previewBoards[0])
//            BoardRow(board: previewBoards[1])
            
            // Temp change to show updating parent's state from a child view
            BoardRow(board: previewBoards[0], boards: .constant(previewBoards))
            BoardRow(board: previewBoards[1], boards: .constant(previewBoards))
        }.previewLayout(.fixed(width: 300, height: 70))
    }
}
