//
//  Game.swift
//  lab09
//
//  Created by luo on 2021/5/21.
//

import Foundation




class Game : ObservableObject {
    
    @Published var playerType : String?
    @Published var botType: String?
    @Published var gameResult: String
    
    init() {
        self.playerType = "stone"
        self.botType = "stone"
        self.gameResult = "tie"

    }

}


enum type : CaseIterable{
    
    case paper
    case scissor
    case stone
    
    
}



