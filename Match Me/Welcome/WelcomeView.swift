//
//  WelcomeView.swift
//  Match Me
//
//  Created by Dung Nguyen Hung on 28/08/2022.
//

import SwiftUI

struct WelcomeView: View {
    @State var isWelcomeActive: Bool = true
    var body: some View {
        ZStack {
            if isWelcomeActive {
                GreetingView(playActive: $isWelcomeActive)
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
