//
//  MessagesView.swift
//  G&G
//
//  Created by Kylie Liang on 5/21/22.
//

import SwiftUI

struct MessagesView: View {
    @StateObject var messagesManager = MessagesManager()
    var body: some View {
        VStack {
            VStack {
                TitleRow()
                
                ScrollView{
                    ForEach(messagesManager.messages, id: \.id) { message in
                        MessageBubble(message: message)
                    }
                }
                .padding()
                .background(Color("Background Cream"))
            }
            .background(Color("Accent Green"))
            
            MessageField()
                .environmentObject(messagesManager)
                
        }
        .background(Color("Background Cream"))
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
