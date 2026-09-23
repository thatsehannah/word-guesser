//
//  Word.swift
//  WordGuesser
//
//  Created by Elliot Hannah III on 9/23/26.
//

import Foundation

struct Word {
    static let empty: Letter = ""
    
    var kind: Kind
    var letters: [Letter] = Array(repeating: "a", count: 5)
    
    enum Kind: Equatable {
        case master(isHidden: Bool)
        case guess
        case attempt
        case unknown
    }

    var word: String {
        get { letters.joined()}
        set { letters = newValue.map { String ($0)}}
    }
    
}
