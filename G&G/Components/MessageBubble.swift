//
//  MessageBubble.swift
//  G&G
//
//  Created by Michael Liu on 6/18/22.
//

import SwiftUI

struct MessageBubble: View{
    var message: Message
    @State private var showTime = false
    
    var body: some View {
        VStack(alignment: message.received ? .leading : .trailing){
            HStack{
                Text(message.text)
                    .padding()
                    .background(message.received ?
                                Color("Light Green") : Color("Bold Green"))
                    .foregroundColor(Color("Text Color"))
                    .cornerRadius(30)
            }
            .frame(maxWidth: 300, alignment: message.received ? .leading : .trailing)
            .onTapGesture {
                showTime.toggle()
            }
            if (showTime){
                Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .padding(message.received ? .leading : .trailing, 25)
            }
        }
        .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
        .padding(message.received ? .leading : .trailing)
        .padding(.horizontal, 10)
        
    }
    
}

struct MessageBubble_Preview: PreviewProvider{
    static var previews: some View{
        MessageBubble(message: Message(id: "123", text: "first message", received: false, timestamp: Date()))
    }
}
