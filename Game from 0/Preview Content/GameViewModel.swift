//
//  GameViewModel.swift
//  Game from 0
//
//  Created by bsamh on 28/11/2023.
//


import Combine

class GameViewModel: ObservableObject {
    @Published var gameCode: String = ""
    @Published var playerProgress: Int = 0
    // Add more game-related properties and methods as needed
}
