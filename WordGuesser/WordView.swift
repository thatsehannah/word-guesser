//
//  WordView.swift
//  WordGuesser
//
//  Created by Elliot Hannah III on 9/23/26.
//

import SwiftUI

struct WordView: View {
    // MARK: Data in
    let word: Word
    
    @Binding var selection: Int
    
    var body: some View {
        ForEach(word.letters.indices, id: \.self) { index in
            LetterView(letter: word.letters[index])
                .padding(Selection.border)
                .background {
                    if selection == index, word.kind == .guess {
                        Selection.shape
                            .foregroundStyle(Selection.color)
                    }
                }
                .onTapGesture {
                    if word.kind == .guess {
                        selection = index
                    }
                }
        }
    }
    
    struct Selection {
        static let border: CGFloat = 5
        static let cornerRadius: CGFloat = 10
        static let color: Color = .gray
        static let shape = RoundedRectangle(cornerRadius: cornerRadius)
    }
}

//#Preview {
//    WordView()
//}
