//
//  CustomInputField.swift
//  G&G
//
//  Created by Kylie Liang on 5/21/22.
//

import SwiftUI

struct CustomInputField: View {
    let imageName: String
    let placeholderText: String
    @Binding var text: String
    
    var body: some View {
        VStack {
            HStack {
                
                VStack {
                    Image(systemName: imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25,height: 25)
                        .foregroundColor(Color(.white))
                }
                .frame(width: 50,height: 50)
                .background(Color.green)
                .cornerRadius(30)
                
                TextField(placeholderText, text: $text)
                    .foregroundColor(Color(.white))
            }
            .background(Color.yellow)
            .cornerRadius(30)
        }
        .shadow(color: .gray, radius: 1, x:0, y:4)
    }
}

struct CustomInputField_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputField(imageName: "envelope",
                         placeholderText: "Email",
                         text: .constant(""))
    }
}
