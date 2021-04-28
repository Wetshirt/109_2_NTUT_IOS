//
//  ContentView.swift
//  Dice
//
//  Created by Luo on 2021/4/28.
//

import SwiftUI




struct ContentView: View {
    
    @State private var d1 = 1
    @State private var d2 = 1
    @State private var d3 = 1
    
    
    @State private var input = ""
    @State private var totalNumber = 1000
    
    @State private var start = false
    @State private var result = "猜測中"
    
    
    var body: some View {
        
        VStack {
            
            Text("骰子遊戲").font(.largeTitle).foregroundColor(.pink)
            
            Spacer().frame(height: 100)
            //dice1
            HStack {
                
                Image(systemName: "die.face.\(d1)")
                    .resizable()
                    .frame(width: 100, height: 100)
                Text("骰子1數字：\(d1)").font(.title)
                
                

            }
            
            //dice2
            HStack {
                
                Image(systemName: "die.face.\(d2)")
                    .resizable()
                    .frame(width: 100, height: 100)
                Text("骰子2數字：\(d2)").font(.title)
                
                

            }
            
            //dice3
            HStack {
                
                Image(systemName: "die.face.\(d3)")
                    .resizable()
                    .frame(width: 100, height: 100)
                Text("骰子3數字：\(d3)").font(.title)
                
                

            }
            
            HStack {
                TextField("請輸入猜測總和", text: $input)
                    .frame(width: 200, height: 50)
                Button(
                    action : {
                        d1 = Int.random(in :1...6)
                        d2 = Int.random(in :1...6)
                        d3 = Int.random(in :1...6)
                        
                        start = true
                        
                        if Int(input)! >= (d1 + d2 + d3) {
                            totalNumber  = totalNumber + 100
                            result = "猜測成功 +100"
                        }
                        else{
                            totalNumber  = totalNumber - 100
                            result = "猜測失敗 -100"

                        }
                        
                    },
                    label: {
                            Text("play").font(.largeTitle)
                    }
                )
                
            }
               
            Text("猜測結果: " + result).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            
            Text("目前金額:\(totalNumber)").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)

            
        }
        

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
