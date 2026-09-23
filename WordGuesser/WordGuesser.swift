//
//  WordGuesser.swift
//  WordGuesser
//
//  Created by Elliot Hannah III on 9/23/26.
//

import Foundation

typealias Letter = String

struct WordGuesser {
    var masterWord: Word
    var guess: Word
    var attempts: [Word] = []
    let letterChoices: [Letter]
    
    init() {
        self.letterChoices = "QWERTYUIOPASDFGHJKLZXCVBNM".map { String($0)}
        self.masterWord = Word(kind: .master(isHidden: false))
        self.guess = Word(kind: .guess, letters: Array(repeating: "", count: masterWord.letters.count))
    }
}
