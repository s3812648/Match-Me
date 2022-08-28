//
//  GameView.swift
//  Match Me
//
//  Created by Dung Nguyen Hung on 28/08/2022.
//

import SwiftUI

struct GameView: View {
    private var fourColumnGrid = [GridItem(.flexible()),
                                  GridItem(.flexible()),
                                  GridItem(.flexible()),
                                  GridItem(.flexible())]

    
    @State var cards = createCardList().shuffled()
    @State var MatchedCards = [Card]()
    @State var UserChoices = [Card]()
    @State var showingInfoView = false
    @State var isShowGameOver: Bool = false
    @ObservedObject var stopWatchManager = StopWatchManager()
    @State var UserMoveCount = 0
    
    
    var body: some View {
        
        ZStack{
            if isShowGameOver {
                GameOver(gameOverActive: $isShowGameOver, MatchedCard: $MatchedCards, UserMove: $UserMoveCount)
            }else{
                HStack{
                    GeometryReader{geo in
                        VStack{
                            Text("Matching")
                                .font(.largeTitle)
                            
                            LazyVGrid(columns: fourColumnGrid, spacing: 10) {
                                ForEach(cards) {card in
                                    CardView(card: card,
                                             width: Int(geo.size.width/4 - 10),
                                             MatchedCards: $MatchedCards,
                                             UserChoices: $UserChoices, showGameOver: $isShowGameOver, UserMove: $UserMoveCount
                                    
                                    )
                                }
                            }
                            Spacer()
                            VStack{
                                Text("Cards left: ")
                                LazyVGrid(columns: fourColumnGrid, spacing: 5){
                                    ForEach (cardValues, id:\.self) {cardValue in
                                        if !MatchedCards.contains(where: {$0.text == cardValue}){
                                            Text(cardValue)
                                                .font(.system(size: 40))
                                
                                        }
                                    }
                                }
                            }
                            Spacer()
//                            Text(String(format: "%.1f", stopWatchManager.secondsElapsed))
//                                .font(.custom("Avenir", size: 60))
//                                .padding()
                            Text("You have moved")
                            Text("\(UserMoveCount) times")
                        }
                       
                    }
                }
            }
            
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

