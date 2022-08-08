//
//  CardsList.swift
//  InspoBoard (iOS)
//
//  Created by Kelsey Steven on 8/3/22.
//

import SwiftUI

struct CardsList: View {
    var board: Board

    var body: some View {
        VStack {
            List(board.cards) { card in
                Text(card.message)
            }
            
            Button {
                print("add card pressed")
            } label: {
                Text("Add Card")
            }
            .padding()
        }
    }
}

struct CardsList_Previews: PreviewProvider {
    static var previews: some View {
        CardsList(board: previewBoards[0])
    }
}
