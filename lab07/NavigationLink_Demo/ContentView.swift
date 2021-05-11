//
//  ContentView.swift
//  NavigationLink_Demo
//
//  Created by Luo on 2021/5/4.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView{
        
            VStack {

                Image("台北車站鬼父雕像")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                
                NavigationLink(
                    destination: OriginView(),
                    label: {
                        Text("起源爭議")
                    })
                NavigationLink(
                    destination: DistributeView(),
                    label: {
                        Text("分佈")
                    })
                
                
                
                
             }
            .navigationTitle("鬼父")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
