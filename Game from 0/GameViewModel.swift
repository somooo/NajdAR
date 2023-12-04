//
//  GameViewModel.swift
//  Game from 0
//
//  Created by bsamh on 28/11/2023.
//


import Combine

class Game: ObservableObject {
    @Published var gameCode: String = ""
    @Published var gameCreator: String = ""
    @Published var playerID: String = ""
    @Published var treasureCollected: Int = 0
}
