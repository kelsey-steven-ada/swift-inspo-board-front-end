//
//  CardsList.swift
//  InspoBoard (iOS)
//
//  Created by Kelsey Steven on 8/3/22.
//

import SwiftUI

struct CardsList: View {
    var board: Board
    @Binding var boards: [Board]

    var body: some View {
        VStack {
            List(board.cards) { card in
                Text(card.message)
            }
            .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
            
            Button {
//                print("add card pressed")
                
                // Temp change to show updating parent's state from a child view
                // Create the new board to add
                let newBoard = Board(id: 10, name: "Fake Board", owner: "Nobody", cards: [])
                var newBoardsList = boards      // Create a copy of the old data
                newBoardsList.append(newBoard)  // Make updates on the new list
                boards = newBoardsList          // Update the binding to the new list
            } label: {
//                Text("Add Card")
                
                // Temp change to show updating parent's state from a child view
                Text("Add Board")
                    .frame(maxWidth: .infinity)
            }
            .padding()
            .padding(.bottom)
        }
        .navigationBarTitle(Text(board.name), displayMode: .inline)
    }
}

struct CardsList_Previews: PreviewProvider {
    static var previews: some View {
//        CardsList(board: previewBoards[0])
        
        // Temp change to show updating parent's state from a child view
        CardsList(board: previewBoards[0], boards: .constant(previewBoards))
    }
}
