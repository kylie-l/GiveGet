//
//  JournalViewRow.swift
//  G&G
//
//  Created by Kylie Liang on 5/21/22.
//

import SwiftUI

struct JournalViewRow: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12){
            
            //profile pic + username + time
            HStack(alignment: .top, spacing: 12) {
                Circle()
                    .frame(width: 40, height: 40)
                
                //username + time
                VStack(alignment: .leading, spacing: 3){
                    Text("Username")
                    Text("Time")
                }
            }
            
            //Journal entry
            ZStack {
                Color.green
                Text("journal entry ewfk edkn e")
                    .multilineTextAlignment(.leading)
                    .aspectRatio(contentMode: .fit)
                
            }
            .aspectRatio(contentMode: .fit)
            //.frame(width: 300, height: .infinity, alignment: .center)
            .cornerRadius(20)
        }
        .padding()
    }
}

struct JournalViewRow_Previews: PreviewProvider {
    static var previews: some View {
        JournalViewRow()
    }
}
