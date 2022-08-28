//
//  GreetingView.swift
//  Match Me
//
//  Created by Dung Nguyen Hung on 28/08/2022.
//

import SwiftUI

struct GreetingView: View {
    @ObservedObject var stopWatchManager = StopWatchManager()

    @Binding var playActive: Bool
    var body: some View {
        ZStack{
            Color(.purple).ignoresSafeArea(.all, edges: .all)
            
            VStack(spacing: 20){
                Spacer()
                VStack(spacing: 0) {
                    Text("Welcome to Match Me")
                      .font(.system(size: 60))
                      .fontWeight(.heavy)
                      .foregroundColor(.white)
                      .multilineTextAlignment(.center)
                    Text("Are you ready for your brain test ?")
                      .font(.title3)
                      .fontWeight(.light)
                      .foregroundColor(.white)
                      .multilineTextAlignment(.center)
                      .padding(.horizontal, 10)
                    
                    
                }
                Spacer()
                
                    
                Image("logo3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300)
                
                
                Spacer()

                if stopWatchManager.mode == .stopped {
                    Button(action: {
                        playActive = false
                        self.stopWatchManager.start()
                        
                    }, label: {
                        Capsule()
                          .fill(Color.white.opacity(0.2))
                          .padding(8)
                          .frame(height:80)
                          .overlay(Text("Let's play")
                            .font(.system(.title3, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.white))
                    })
                }
                
            }
        }
    }
}

struct GreetingView_Previews: PreviewProvider {
    static var previews: some View {
        GreetingView(playActive: .constant(true))
    }
}
