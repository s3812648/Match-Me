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

struct WelcomeView: View {
    @State var isWelcomeActive: Bool = true
    @State var showingHighScore = true
    var body: some View {
        ZStack {
            if isWelcomeActive {
                GreetingView(playActive: $isWelcomeActive, showingHighScore: $showingHighScore)
            } else {
                GameView()
            }
        }
        }
        
    }


struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
