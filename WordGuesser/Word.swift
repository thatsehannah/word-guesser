//
//  Word.swift
//  WordGuesser
//
//  Created by Elliot Hannah III on 9/23/26.
//

import Foundation

enum MatchOption {
    case exact
    case inexact
    case nomatch
}

struct Word {
    static let empty: Letter = ""
    
    var kind: Kind
    var letters: [Letter] = Array(repeating: "a", count: 5)
    
    enum Kind: Equatable {
        case master(isHidden: Bool)
        case guess
        case attempt([MatchOption])
        case unknown
    }

    var word: String {
        get { letters.joined()}
        set { letters = newValue.map { String ($0)}}
    }
    
    var comparisonResults: [MatchOption]? {
        switch kind {
        case .attempt(let results): return results
        default: return nil
        }
    }
    
    mutating func reset() {
        letters = Array(repeating: Word.empty, count: letters.count)
    }
    
    func compareGuess(against: Word) -> [MatchOption] {
//        if self.letters.count != against.letters.count {
//            return nil
//        }
        
        var lettersToCompareAgainst = against.letters
        var matchResults: [MatchOption] = Array(repeating: .nomatch, count: self.letters.count)
        
        for index in letters.indices.reversed() {
            if lettersToCompareAgainst.count > index, lettersToCompareAgainst[index] == letters[index] {
                lettersToCompareAgainst.remove(at: index)
                matchResults[index] = .exact
            } else {
                matchResults[index] = .nomatch
            }
        }
        
        for index in lettersToCompareAgainst.indices {
            if matchResults[index] != .exact, let matchIndex = lettersToCompareAgainst.firstIndex(of: letters[index]) {
                lettersToCompareAgainst.remove(at: matchIndex)
                matchResults[index] = .inexact
            }
        }
    
        
        return matchResults
    }
    
}
