//
//  JournalViewRow.swift
//  G&G
//
//  Created by Kylie Liang on 5/21/22.
//

import SwiftUI

struct JournalViewRow: View {
    let prompt: Prompt
    
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 12){
            
            
            //profile pic + username + time
            HStack(alignment: .top, spacing: 12) {
                Circle()
                    .frame(width: 40, height: 40)
                
                //username + time
                VStack(alignment: .leading, spacing: 3){
                    Text("annhockey20")
                        .foregroundColor(.black)
                    //Text(prompt.timestamp.FormatString)
                }
            }
            
            //Journal entry
            ZStack {
                Color("Accent Cream")
                Text(prompt.caption)
                    .multilineTextAlignment(.leading)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color("Text Dark Color"))
                
            }
            .aspectRatio(contentMode: .fit)
            //.frame(width: 300, height: .infinity, alignment: .center)
            .cornerRadius(20)
        }
        .padding()
    }
}


