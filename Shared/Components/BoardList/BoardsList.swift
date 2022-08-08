//
//  BoardsList.swift
//  InspoBoard (iOS)
//
//  Created by Kelsey Steven on 8/3/22.
//

import SwiftUI

struct BoardsList: View {
    @Binding var boards: [Board]
    @EnvironmentObject var apiManager: InspoBoardAPIManager
    
    var body: some View {
        NavigationView {
            VStack {
                List(boards) { board in
                    NavigationLink {
                        CardsList(board: board)
                    } label: {
                        BoardRow(board: board)
                    }
                }
            }            
        }
    }
}

struct BoardsList_Previews: PreviewProvider {
    static var previews: some View {
        BoardsList(boards: .constant(previewBoards))
    }
}
