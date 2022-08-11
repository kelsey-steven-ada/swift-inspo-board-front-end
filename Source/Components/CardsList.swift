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
            .cornerRadius(20, corners: [.bottomLeft, .bottomRight])

            Button {
                print("add card pressed")
            } label: {
                Text("Add Card")
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
        CardsList(board: previewBoards[0])
    }
}
