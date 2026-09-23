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
    
    var body: some View {
        VStack {
            showView(for: game.masterWord)
            ScrollView {
                showView(for: game.guess)
                ForEach(game.attempts.indices.reversed(), id: \.self) { index in
                    showView(for: game.attempts[index])
                }
            }
        }
        .padding()
        .onChange(of: words.count, initial: true) {
            if game.attempts.count == 0 {
                if words.count == 0 {
                    game.masterWord.word = "AWAIT"
                } else {
                    game.masterWord.word = words.random(length: Int.random(in: 3...6)) ?? "ERROR"
                }
                game.guess.letters = Array(repeating: "", count: game.masterWord.word.count)
            }
        }
    }
    
    func showView(for word: Word) -> some View {
        HStack {
            ForEach(word.letters.indices, id: \.self) { index in
                RoundedRectangle(cornerRadius: 10)
                    .contentShape(RoundedRectangle(cornerRadius: 10))
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundStyle(.blue)
                    .overlay {
                        Text("\(word.letters[index])")
                            .font(.system(size: 120))
                            .minimumScaleFactor(9/120)
                    }
            }
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
