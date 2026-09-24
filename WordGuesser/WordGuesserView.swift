//
//  ContentView.swift
//  WordGuesser
//
//  Created by Elliot Hannah III on 9/23/26.
//

import SwiftUI

struct WordGuesserView: View {
    @Environment(\.words) var words
    
    @State private var game = WordGuesser()
    @State private var seletion: Int = 0
    
    var body: some View {
        VStack {
            showView(for: game.masterWord)
            ScrollView {
                showView(for: game.guess)
                ForEach(game.attempts.indices.reversed(), id: \.self) { index in
                    showView(for: game.attempts[index])
                }
            }
            Button("Restart Game") {
                withAnimation {
                    game = WordGuesser()
                    game.reset(words: words)
                }
            }
        }
        .padding()
        .onChange(of: words.count, initial: true) {
            if game.attempts.count == 0 {
                game.reset(words: words)
            }
        }
    }
    
    func showView(for word: Word) -> some View {
        HStack {
            WordView(word: word, selection: $seletion)
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(Color.clear)
                .aspectRatio(1, contentMode: .fit)
                .overlay {
                    if word.kind == .guess {
                        Button("Guess") {
                            withAnimation {
                                print("random word = \(words.random(length: 5) ?? "none")")
                            }
                        }
                    }
                }
        }
    }
}

#Preview {
    WordGuesserView()
}
