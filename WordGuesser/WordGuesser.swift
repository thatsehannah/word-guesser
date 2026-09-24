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
    
    mutating func setGuessLetter(_ letter: Letter, at index: Int) {
        guess.letters[index] = letter
    }
    
    mutating func reset(words: Words) {
        if words.count == 0 {
            masterWord.word = "AWAIT"
        } else {
            masterWord.word = words.random(length: Int.random(in: 3...6)) ?? "ERROR"
        }
        
        guess.letters = Array(repeating: Word.empty, count: masterWord.word.count)
    }
}
