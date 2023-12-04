//
//  GameCodeGenerator.swift
//  Game from 0
//
//  Created by bsamh on 28/11/2023.
//

struct GameCodeGenerator {
    static func generateGameCode() -> String {
        let characters = "0123456789"
        let codeLength = 6
        var GameCode = ""

        for _ in 0..<codeLength {
            let randomIndex = characters.index(characters.startIndex, offsetBy: Int.random(in: 0..<characters.count))
            let character = characters[randomIndex]
            GameCode.append(character)
        }

        return GameCode
    }
}
