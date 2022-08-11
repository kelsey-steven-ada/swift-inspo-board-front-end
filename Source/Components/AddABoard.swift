//
//  AddABoard.swift
//  InspoBoard (iOS)
//
//  Created by Kelsey Steven on 8/3/22.
//

import SwiftUI

struct AddABoard: View {
    @State private var name = ""
    @State private var owner = ""
    @State private var isLoadingData = false
    @Binding var boards: [Board]
    @EnvironmentObject private var apiManager: InspoBoardAPIManager
    @EnvironmentObject private var navigationManager: NavigationManager

    var body: some View {
        if isLoadingData {
            LoadingView()
                .background(gradient)
                .task {
                    var isAddSuccess = false
                    do {
                        isAddSuccess = try await apiManager.createABoard(
                            name: name,
                            owner: owner
                        )
                    } catch {
                        print("Error adding board: \(error)")
                        isLoadingData = false
                    }
                    
                    if isAddSuccess {
                        do {
                            boards = try await apiManager.getAllBoards()
                            isLoadingData = false
                            name = ""
                            owner = ""
                            navigationManager.activeTab = 0
                        } catch {
                            print("Error getting boards: \(error)")
                            isLoadingData = false
                        }
                    }
                }
            
        } else {
            VStack {
                Form {
                    Section {
                        HStack {
                            Text("Name:")
                            TextField("Enter a new Board's name", text: $name)
                        }
                    }

                    Section {
                        HStack {
                            Text("Owner:")
                            TextField("Enter the new Board's owner", text: $owner)
                        }
                    }
                }
                Spacer()
                
                Button {
                    isLoadingData = true
                } label: {
                    Text((name.isEmpty || owner.isEmpty) ? "Enter a name & owner above" : "Add New Board")
                        .frame(maxWidth: .infinity)
                }
                .disabled(name.isEmpty || owner.isEmpty)
                .padding()
                .padding(.bottom)
            }
        }
    }
}

struct AddABoard_Previews: PreviewProvider {
    static var previews: some View {
        AddABoard(boards: .constant(previewBoards))
    }
}
