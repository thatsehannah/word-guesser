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
    @State private var selection: Int = 0
    @State private var checker = UITextChecker()
    
    var body: some View {
        VStack {
            showView(for: game.masterWord)
            ScrollView {
                showView(for: game.guess)
                ForEach(game.attempts.indices.reversed(), id: \.self) { index in
                    showView(for: game.attempts[index])
                }
            }
            LetterChooserView(choices: game.letterChoices) { letter in
                game.setGuessLetter(letter, at: selection)
                selection = (selection + 1) % game.guess.letters.count
            }
            Spacer()
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
    
    func checkGuess(_ guess: String) {
        if guess != "", checker.isAWord(guess) {
            game.submitGuess()
        } else {
            game.guess.reset()
        }
    }
    
    func showView(for word: Word) -> some View {
        HStack {
            WordView(word: word, selection: $selection)
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(Color.clear)
                .aspectRatio(1, contentMode: .fit)
                .overlay {
                    if word.kind == .guess {
                        Button("Guess") {
                            withAnimation {
                                checkGuess(word.word.lowercased())
                            }
                            
                        }
                        .font(.system(size: 80))
                        .minimumScaleFactor(8/80)
                    }
                }
        }
    }
}

#Preview {
    WordGuesserView()
}
