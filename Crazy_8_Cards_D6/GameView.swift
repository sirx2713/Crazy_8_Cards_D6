//
//  ContentView.swift
//  Crazy_8_Cards_D6
//
//  Created by Tafadzwa Alexander Razaro on 2024/02/28.
//

import SwiftUI

struct GameView: View {
    
    //Holds the player cards
    @State var playerCard = "back"
    
    //Holds the cpu cards
    @State var cpuCard = "back"
    
    //Stores the player score
    @State var playerScore = 0
    
    //Stores the cpu score
    @State var cpuScore = 0
    
    var body: some View {
        ZStack {
            Image("background-plain")
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                Image("logo")
                Spacer()
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                    
                }
                Spacer()
                Button(action: {
                    deal()
                }, label: {
                    Image("button")
                })
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .foregroundColor(Color.white)
                        Text(String(playerScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .foregroundColor(Color.white)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
    
    func deal() {
        //Randomise the player cards
        let playerCardValue = Int.random(in: 2...14)
        playerCard = "card" + String(playerCardValue)
        
        //Randomise the cpu card
        let cpuCardValue = Int.random(in: 2...14)
        cpuCard = "card" + String(cpuCardValue)
        
        //Add 4 to player score
        if playerCard > cpuCard {
            playerScore += 4
        }
        
        //Add 1 if it is a tie
        else if playerCard == cpuCard {
            playerScore += 1
            cpuScore += 1
        }
        
        //Add 4 to cpu score
        if cpuCard > playerCard {
            cpuScore += 4
        }
    }
}

#Preview {
    GameView()
}
