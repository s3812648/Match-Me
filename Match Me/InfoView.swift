//
//  InfoView.swift
//  Match Me
//
//  Created by Dung Nguyen Hung on 28/08/2022.
//

import SwiftUI

struct InfoView: View {
  @Environment(\.dismiss) var dismiss
  
  var body: some View {
      ZStack{
          Color("ColorBlueRMIT")
          VStack(alignment: .center, spacing: 10) {
            Image("logo1")
                  .resizable()
                  .scaledToFit()
            
            Spacer()
            
            Form {
              Section(header: Text("How To Play")) {
                  Text("There are 8 pairs of folding cards")
                  Text("Pick 2 cards which look alike to face them up")
                  Text("2 different cards picked will be folded again")
                  Text("There is a move count below, the less you move, the better your result is")
              }
                Section(header: Text("Application Information")) {
                    HStack {
                      Text("App Name")
                      Spacer()
                      Text("Match Me")
                    }
                    HStack {
                      Text("Course")
                      Spacer()
                      Text("COSC2659")
                    }
                    HStack {
                      Text("Year Published")
                      Spacer()
                      Text("2022")
                    }
                    HStack {
                      Text("Location")
                      Spacer()
                      Text("Saigon South Campus")
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
            .padding(.trailing, 20),
            alignment: .topTrailing
            )
      }
    
  }
}


struct InfoView_Previews: PreviewProvider {
  static var previews: some View {
    InfoView()
  }
}
