//
//  ContentView.swift
//  lab09
//
//  Created by luo on 2021/5/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var game = Game()
    @State var isStart: Bool = false
    
    var body: some View {
        
        VStack(){
            
            Text("猜拳遊戲")
                .font(.title)
            
            Spacer()
            
            HStack() {

                Text("玩家: ").font(.title2)
                Image(game.playerType!)
                    .resizable()
                    .frame(width: 80, height: 80)
                Text(game.playerType!).font(.title2)
            }
            
            HStack() {

                Text("電腦: ").font(.title2)
                Image(game.botType!)
                    .resizable()
                    .frame(width: 80, height: 80)
                Text(game.botType!).font(.title2)
            }
            
            ZStack() {
                
                Image("paperscissorstone")
                    .resizable()
                    .frame(width: 300, height: 300)
                
                Button(action: {
                    isStart = true
                    makeGame(game: game)
                    
                }) {
                    Text("出拳").font(.title2)
                }

            }
            
            (Text("結果:   ") + (isStart ?
                                    Text(game.gameResult):Text("請按“出拳”開始猜拳")).foregroundColor(.pink))
                .font(.title2)
            
            
            Spacer()
        }
        
   
    }
}

struct ContentView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        ContentView()
    }
}
