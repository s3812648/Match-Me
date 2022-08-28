//
//  HighScores.swift
//  Match Me
//
//  Created by Dung Nguyen Hung on 28/08/2022.
//

import SwiftUI

struct HighScores: View {
    @Environment(\.dismiss) var dismiss
    @State var highscores = UserDefaults.standard.array(forKey: "highscores") as? [Int] ?? [100,100,100,100,100]
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Form{
                Section(header: Text("Leaderboard")) {
                    if (0 < highscores.count) {
                        Text("\(highscores[0])")
                    }
                    if (1 < highscores.count) {
                        Text("\(highscores[1])")
                    }
                    if (2 < highscores.count) {
                        Text("\(highscores[2])")
                    }
                    if (3 < highscores.count) {
                        Text("\(highscores[3])")
                    }
                    if (4 < highscores.count) {
                        Text("\(highscores[4])")
                    }
                    if (5 < highscores.count) {
                        Text("\(highscores[0])")
                    }
                }
            }
            .font(.system(.body, design: .rounded))
        }
        .padding(.top, 40)
        .overlay(
            Button(action: {
            dismiss()
            }) {
                Image(systemName: "xmark.circle")
                    .font(.title)
                    .foregroundColor(.black)
                }
                .foregroundColor(.white)
                .padding(.top, 30)
                .padding(.trailing
                         , 20), alignment: .topTrailing
            )
    }
}

struct HighScores_Previews: PreviewProvider {
    static var previews: some View {
        HighScores()
    }
}
