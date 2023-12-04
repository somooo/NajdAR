//
//  GameProgressView.swift
//  Game from 0
//
//  Created by bsamh on 28/11/2023.
//

import Foundation
import SwiftUI

struct GameProgressView: View {
    @ObservedObject var viewModel: GameViewModel

    var body: some View {
        VStack {
            Text("Game Code: \(viewModel.gameCode)")
                .font(.title)

            Text("Player Progress: \(viewModel.playerProgress)")
                .font(.headline)
                .padding()

            // Add more UI elements as needed
        }
        .padding()
    }
}
