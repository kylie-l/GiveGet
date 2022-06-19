//
//  MessagesManager.swift
//  G&G
//
//  Created by Michael Liu on 6/18/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class MessagesManager: ObservableObject{
    @Published private(set) var messages: [Message] = []
    let db = Firestore.firestore()
    
    init(){
        getMessages()
    }
    
    func getMessages(){
        db.collection("messages").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("error fetching docs: \(String(describing: error))")
                return
            }
            
            self.messages = documents.compactMap { document -> Message? in
                do{
                    try document.data()
                    return try document.data(as: Message.self)
                } catch{
                    print("error decoding doc into message: \(error)")
                    return nil
                }
            }
            self.messages.sort { $0.timestamp < $1.timestamp }
        }
    }
    
    func sendMessage(text: String){
        do{
            let newMessage = Message(id: "\(UUID())", text: text, received: false, timestamp: Date())
            try db.collection("messages").document().setData(from: newMessage)
        }catch{
            print("Error adding message \(error)")
            return
        }
    }
}
