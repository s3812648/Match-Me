//RMIT University Vietnam
//  Course: COSC2659 iOS Development
//  Semester: 2022B
//  Assessment: Assignment 2
//  Author: Nguyen Hung Dung
//  ID: s3812648
//  Created date: 26/08/2022
//  Last modified: 29/08/2022
//  Acknowledgement: Sound package from https://github.com/TomHuynhSG/RMIT-Casino, idea from https://www.youtube.com/watch?v=aJ9kKX6Ak3k.

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
