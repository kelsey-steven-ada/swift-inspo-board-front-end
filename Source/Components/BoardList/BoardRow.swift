//
//  BoardRow.swift
//  InspoBoard (iOS)
//
//  Created by Kelsey Steven on 8/3/22.
//

import SwiftUI

struct BoardRow: View {
    var board: Board
    
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
        }
        .padding()
    }
}

struct BoardRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BoardRow(board: previewBoards[0])
            BoardRow(board: previewBoards[1])
        }.previewLayout(.fixed(width: 300, height: 70))
    }
}
