//
//  LetterChooserView.swift
//  WordGuesser
//
//  Created by Elliot Hannah III on 9/23/26.
//

import SwiftUI

struct LetterChooserView: View {
    // MARK: Data in
    let choices: [Letter]
    let onSelect: (Letter) -> Void
    
    // MARK: - Body
    
    var body: some View {
        Grid(alignment: .center, verticalSpacing: 20) {
            GridRow {
                ForEach(0...9, id: \.self) { num in
                    LetterView(letter: choices[num], isChooser: true)
                        .onTapGesture {
                            onSelect(choices[num])
                        }
                }
            }
            GridRow {
                ForEach(10...18, id: \.self) { num in
                    LetterView(letter: choices[num], isChooser: true)
                        .onTapGesture {
                            onSelect(choices[num])
                        }
                }
            }
            GridRow {
                ForEach(19...25, id: \.self) { num in
                    LetterView(letter: choices[num], isChooser: true)
                        .onTapGesture {
                            onSelect(choices[num])
                        }
                }
            }
        }
    }
}

//#Preview {
//    LetterChooserView()
//}
