//
//  ContentView.swift
//  lab10
//
//  Created by luo on 2021/5/25.
//

import SwiftUI
import FirebaseFirestoreSwift
import Firebase

struct ContentView: View {
    
    @State  var DeadLineTime = Date()
    @State  var isFinished: Bool = true
    @State  var name: String = ""

    @State var todoList = [fileData]()
    
    var body: some View {
        
        VStack() {
            
            Text("Todo App")
                .font(.title)
                .padding()
            
            Text("輸入數據")
            HStack {
                Text("名稱: ")
                TextField("請輸入名稱: ", text: $name)
            }
      
            Toggle(isOn: $isFinished) {
                Text("是否完成")
            }
            .padding(.trailing, 250.0)

            
            DatePicker("到期時間", selection: $DeadLineTime)
                .padding(.trailing, 100.0)
            
            Button(action: createData) {
                Text("新增數據")
            }
            
            Text("-----------------------------------------")
            Text("目前數據")
            
            Button(action: fetchData) {
                Text("讀取數據")
            }
            
            
            List(todoList) { todo in

              VStack(alignment: .leading) {
                Text("名稱: " + todo.name)
                  .font(.headline)
                Text("是否完成: "  + (todo.isFinished ? "是" : "否"))
                  .font(.subheadline)
                Text("到期時間: \(todo.deadlineTime)")
                  .font(.subheadline)
              }
            }
            

        }
       
    }
   
}




extension ContentView {

    func createData() {
            let db = Firestore.firestore()
            
        let data = fileData(name: name, isFinished: isFinished, deadlineTime: DeadLineTime)
            do {
                let documentReference = try db.collection("Todo").addDocument(from: data)
                print(documentReference.documentID)
            } catch {
                print(error)
            }
    }
    
    func fetchData() {
        let db = Firestore.firestore()
        db.collection("Todo").getDocuments { snapshot, error in
                
             guard let snapshot = snapshot else { return }
            
             let todo = snapshot.documents.compactMap { snapshot in
                 try? snapshot.data(as: fileData.self)
             }
            self.todoList = todo
                
         }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
