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
                Spacer()
                VStack {
                    Image(systemName: imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20,height: 20)
                        .foregroundColor(Color(.white))
                }
                .frame(width: 25,height: 25)
                .background(Color.green)
                
                TextField(placeholderText, text: $text)
                    .foregroundColor(Color(.white))
            }
            .background(Color.yellow)
            .cornerRadius(30)
        }
    }
}

struct CustomInputField_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputField(imageName: "envelope",
                         placeholderText: "Email",
                         text: .constant(""))
    }
}
