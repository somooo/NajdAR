//
//  GameProgressView.swift
//  Game from 0
//
//  Created by bsamh on 28/11/2023.
//
import SwiftUI
import Foundation
struct GameProgressView: View {
    @ObservedObject var Game: GameViewModel

    var body: some View {
        VStack {
            Text("Game Code: \(Game.gameCode)")
                .font(.title)

            Text("Player Progress: \(Game.treasureCollected)")
                .font(.headline)
                .padding()

            // Add more UI elements as needed
        }
        .padding()
    }
}


