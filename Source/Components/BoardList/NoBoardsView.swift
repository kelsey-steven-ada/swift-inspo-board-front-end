//
//  NoBoardsView.swift
//  InspoBoard (iOS)
//
//  Created by Kelsey Steven on 8/8/22.
//

import SwiftUI

struct NoBoardsView: View {
    @Binding var boards: [Board]

    var body: some View {
        VStack {
            Text("No boards to display!")
                .font(.title)
                .padding()
            Text("Would you like to add one?")
            AddABoard(boards: $boards)
                .frame(maxHeight: .infinity)
        }
    }
}

struct NoBoardsView_Previews: PreviewProvider {
    static var previews: some View {
        NoBoardsView(boards: .constant(previewBoards))
    }
}
