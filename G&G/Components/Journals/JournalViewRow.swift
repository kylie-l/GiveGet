//
//  JournalViewRow.swift
//  G&G
//
//  Created by Kylie Liang on 5/21/22.
//

import SwiftUI
import Kingfisher

struct JournalViewRow: View {
    let prompt: Prompt
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 12){
            
            //profile pic + username + time
            if let user = prompt.user {
                HStack(alignment: .top, spacing: 12) {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 40, height: 40)
                    
                    //username + time
                    
                    VStack(alignment: .leading, spacing: 3){
                        Text(user.username)
                            .foregroundColor(.black)
                        Text("\(prompt.timestamp.dateValue().formatted(date: .omitted, time: .shortened))")
                            .font(.caption)
                            .foregroundColor(.gray)
                        //Text(prompt.timestamp.FormatString)
                    }
                    
                }
            }
            
            //Journal entry
            ZStack {
                Color("Accent Cream")
                Text(prompt.caption)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color("Text Dark Color"))
                    .padding()
            }
            //.aspectRatio(contentMode: .fit)
            .frame(width: 365, alignment: .center)
            .cornerRadius(20)
            .shadow(color: .gray, radius: 1, x:0, y:2)
        }
        .padding()
    }
}


