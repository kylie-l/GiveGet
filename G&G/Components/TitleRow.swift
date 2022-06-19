//
//  TitleRow.swift
//  G&G
//
//  Created by Michael Liu on 6/18/22.
//

import SwiftUI

struct TitleRow: View{
    var imageURL = URL(string:"https://images.unsplash.com/photo-1582152629442-4a864303fb96?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2787&q=80")
    var name = "Grace Palmer"
    var body: some View {
        HStack(spacing: 20){
            AsyncImage(url: imageURL) {image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .cornerRadius(50)
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading){
                Text(name)
                    .font(.title).bold()
                    .foregroundColor(.white)
                Text("Online")
                    .font(.caption)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "phone.fill")
                .foregroundColor(.gray)
                .padding(10)
                .background(.white)
                .cornerRadius(50)
        }
        .padding(25)
        
    }
}

struct TitleRow_Previews: PreviewProvider {
    static var previews: some View{
        TitleRow()
            .background(Color("Accent Green"))
    }
}
