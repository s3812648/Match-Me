//
//  CardView.swift
//  Match Me
//
//  Created by Dung Nguyen Hung on 26/08/2022.
//

import SwiftUI

struct CardView: View {
    
    @ObservedObject var card:Card
    let width:Int
    @Binding var MatchedCards:[Card]
    @Binding var UserChoices:[Card]
    @Binding var showGameOver: Bool
    @Binding var UserMove: Int
    @ObservedObject var stopWatchManager = StopWatchManager()
    var body: some View {
        
        if card.isFaceUp || MatchedCards.contains(where: {$0.id == card.id}){
            Text(card.text)
                .font(.system(size: 50))
                .padding()
                .frame(width: CGFloat(width), height: CGFloat(width))
                .background(Color(red: 0.68, green: 0.83, blue: 0.96))
                .cornerRadius(10)
                .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(red: 0.18, green: 0.32, blue: 0.46), lineWidth: 5)
                )
        } else {
            Text("?")
                .font(.system(size: 50))
                .padding()
                .frame(width: CGFloat(width), height: CGFloat(width))
                .background(Color(red: 0.68, green: 0.83, blue: 0.96))
                .cornerRadius(10)
                .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(red: 0.18, green: 0.32, blue: 0.46), lineWidth: 5)
                )
                .onTapGesture {
                    UserMove += 1
                    if UserChoices.count == 0 {
                        card.turnOver()
                        UserChoices.append(card)
                    } else if UserChoices.count == 1 {
                        card.turnOver()
                        UserChoices.append(card)
                        withAnimation(Animation.linear.delay(0.1)) {
                            for thisCard in UserChoices {
                                thisCard.turnOver()
                            }
                        }
                        checkForMatch()
                        self.isGameOver()
                        if stopWatchManager.mode == .stopped {
                            self.stopWatchManager.start()
                        }
                    }
                }
            }
        }
    
    func checkForMatch(){
        if UserChoices[0].text == UserChoices[1].text {
            MatchedCards.append(UserChoices[0])
            MatchedCards.append(UserChoices[1])
            
        }
        UserChoices.removeAll()
        
    }
    func isGameOver(){
        if MatchedCards.count == 16{
            showGameOver = true
            
        }
    }
}
    
