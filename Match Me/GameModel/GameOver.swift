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

struct GameOver: View {
    @Binding var gameOverActive: Bool
    @Binding var MatchedCard:[Card]
    @Binding var UserMove: Int
    var body: some View {
            ZStack{
                Color(.white)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Text("GAME OVER")
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                        .padding()
                        .frame(minWidth: 280, idealWidth: 280, maxWidth: 320)
                        .background(Color(.red))
                    
                    Spacer()
                    
                    VStack {
                    
                        Text("""
                                You have finished the challenge with
                                \(UserMove)
                                """)
                            .font(.system(.body, design: .rounded))
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                        Button {
                            self.gameOverActive = false
                            self.MatchedCard.removeAll()
                            UserMove = 0
                        } label: {
                            Text("New Game".uppercased())
                                .font(.system(.title2, design: .rounded))
                        }
                        .padding(.vertical,10)
                        .padding(.horizontal, 20)
                        .background(
                            Capsule()
                                .strokeBorder(lineWidth: 2)
                                .foregroundColor(Color(".red"))
                        )

                    }
                    Spacer()
                }
                .frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 280, idealHeight: 300, maxHeight: 350, alignment: .center)
                .background(Color(.blue))
                .cornerRadius(20)
            }.onAppear(perform: {
                playSound(sound: "drum-music", type: "mp3")
              })        }
    }

//
//struct GameOver_Previews: PreviewProvider {
//    static var previews: some View {
//        GameOver(gameOverActive: .constant(false), MatchedCard: .constant(Text))
//    }
//}
