//
//  OriginView.swift
//  NavigationLink_Demo
//
//  Created by Luo on 2021/5/4.
//

import SwiftUI

struct OriginView: View {
    var body: some View {
        
        let title = ["維基的說法", "鄉民的說法"]
        let lyrics = ["秋月孝三在一次事故後再也硬不起來了。然而在看見一對蘿莉姐妹花的時候，發現自己只能對那對姐妹發情，於是騙了那姐妹的媽媽結婚，好以繼父的身分接近她們，進而進行鬼畜調教…", "凡是中出女兒的人渣都可以稱為鬼父，雖然鬼父這個名詞是二十一世紀才出現的，但事實上鬼父的行為早就出現在人類歷史許久，而從未消滅。"]
        
        
        ForEach(0..<lyrics.count) { index in
            Text(title[index]).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
           Text(lyrics[index])
            Text("\n")
            
        }
    }
}

struct OriginView_Previews: PreviewProvider {
    static var previews: some View {
        OriginView()
    }
}
