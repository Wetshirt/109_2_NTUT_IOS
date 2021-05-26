//
//  FileData.swift
//  lab10
//
//  Created by luo on 2021/5/25.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase


struct fileData: Codable, Identifiable {
    @DocumentID var id: String?
    
    let name: String
    let isFinished: Bool
    let deadlineTime: Date
}




