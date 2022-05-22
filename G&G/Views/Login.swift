//
//  Login.swift
//  G&G
//
//  Created by Kylie Liang on 5/21/22.
//

import SwiftUI

struct Login: View {
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        //parent container
        VStack {
            Spacer()
            //heading
            VStack {
                Text("GG")
                    .font(.system(size: 150))
                Text("SIGN IN")
                    .font(.system(size: 50, weight: .regular, design: .default))
            }
            .frame(height: 200)
            .padding(.bottom, 50)
            
            //details
            VStack(){
                
                TextField("Enter Username", text: $username)
                    .padding(.bottom, 40)
                TextField("Enter Password", text: $password)
                    .padding(.bottom, 40)
                
                Button {
                    print("Sign In")
                } label: {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(.green)
                        .clipShape(Capsule())
                }
                .shadow(color: .gray, radius: 5, x:0, y:4)
                .padding(.bottom, 25)
                
                NavigationLink {
                    Text("Reset password view...")
                } label: {
                    Text("Forgot Password?")
                }
                .padding(.bottom, 15)
                
                //OR
                HStack {
                    VStack {
                        Divider()
                            .background(.black)
                    }
                    
                    Text("OR")
                    
                    VStack {
                        Divider()
                            .background(.black)
                    }
                }
                .padding(.bottom, 20)
                
                Button {
                    print("Sign UP...")
                } label: {
                    Text("Sign Up")
                        .background(.white)
                        .font(.headline)
                        .foregroundColor(.green)
                        .frame(width: 340, height: 50)
                        .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.green, lineWidth: 2))
                }
                .cornerRadius(25)
                
            }
            .padding(.horizontal, 40)
            
            Spacer()
            
        }

    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}

