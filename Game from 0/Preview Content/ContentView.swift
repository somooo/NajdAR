//
//  ContentView.swift
//  Game from 0
//
//  Created by bsamh on 28/11/2023.
//

import SwiftUI
import RealityKit

struct ContentView: View {
    @StateObject private var gameViewModel = GameViewModel()

    var body: some View {
        NavigationView {
            VStack {
                ARGameView()
                    .navigationBarTitle("")

                NavigationLink(destination: GameProgressView(Game: gameViewModel)) {
                    Text("View Game Progress")
                        .padding()
                }
            }
        }
        .onAppear {
            // Generate a random game code when the game is created
            gameViewModel.gameCode = GameCodeGenerator.generateGameCode()
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
