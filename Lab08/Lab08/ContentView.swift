//
//  ContentView.swift
//  Lab08
//
//  Created by luo on 2021/5/15.
//

import SwiftUI

struct ContentView: View {
    
    @State var isFan : Bool = true
    @State var age: Int = 18
    @State var birthTime = Date()
    @State var likeDegree : CGFloat = 5
    @State var selectedIndex = 0
    @State var said = ""
    
    @State var showAlert = false
    
    var roles = ["愛是神馬", "我是鄭家純", "深夜保健室"]
    
    
    var body: some View {
        
        VStack {
            

            

            Text("黑菊姐")
                .font(.title)
            
            Image("blackorange")
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .blur(radius: 5)

            Spacer()
            Toggle(isOn: $isFan, label: {
                Text("是粉絲嗎？")
            })
            
            Stepper("年齡: \(age)", value: $age)
            
            DatePicker("生日: ", selection: $birthTime, displayedComponents: .date)
            



            Slider(value: $likeDegree, in: 0...10, step: 1, minimumValueLabel: Text("喜歡程度"), maximumValueLabel: Text("\(Int(likeDegree))分")){
                Text("age")
             }

            HStack{
                Text("喜歡作品: ")
                
                Picker(selection: $selectedIndex, label: Text("選擇角色")) {
                    ForEach(roles.indices) { (index) in
                       Text(roles[index])
                    }
                }
            }
            
            TextField("唉呦， 很黑喔", text: $said)
            
            Button(action: {
               showAlert = true
            }) {
               VStack {
                    
                Text("送出")
                .fontWeight(.bold)
                .font(.title)
                .foregroundColor(.purple)
                .padding()
                .border(Color.purple, width:10)

               }
            }.alert(isPresented: $showAlert) { () -> Alert in

                let result  = isFan ? "是": "不是"
                

                
                let msg = [Text("他今年\(age)歲\n他的生日是 "), Text(birthTime, style: .date), Text("\n我\(Int(likeDegree))分喜歡她\n"),
                    Text("我喜歡的作品是 \(roles[selectedIndex])\n"),
                Text("我想對他說 \(said)")]

                
                
                return Alert(title: Text("我\(result)黑菊姐的粉絲"), message: msg[0] + msg[1] + msg[2] + msg[3] + msg[4])
            }
            
            
            
        }
        .padding(10)
        
        
   
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
