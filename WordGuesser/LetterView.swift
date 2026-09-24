//
//  LetterView.swift
//  WordGuesser
//
//  Created by Elliot Hannah III on 9/23/26.
//

import SwiftUI

struct LetterView: View {
    // MARK: Data in
    let letter: Letter
    
    let letterShape = RoundedRectangle(cornerRadius: 10)
    
    var body: some View {
        letterShape
            .foregroundStyle(Color.orange)
            .contentShape(letterShape)
            .aspectRatio(1, contentMode: .fit)
            .overlay {
                Text(letter)
                    .font(.system(size: 90))
                    .minimumScaleFactor(9/90)
            }
    }
}

//#Preview {
//    LetterView(letter: "A")
//}
