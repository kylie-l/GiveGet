//
//  Login.swift
//  G&G
//
//  Created by Kylie Liang on 5/21/22.
//

import SwiftUI

struct Login: View {
    @State private var email = ""
    @State private var password = ""
    @State var selection: Int? = nil
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            //parent container
            VStack {
                AuthHeadingV(title: "SIGN IN")
                    .padding(.bottom, 50)
                
                //details
                VStack(){
                    
                    CustomInputField(imageName: "envelope", placeholderText: "Enter Email", text: $email)
                        .padding(.bottom, 25)
                    CustomInputField(imageName: "lock", placeholderText: "Enter Password", text: $password)
                        .padding(.bottom, 25)
                    
                    NavigationLink (destination: AnswerPromptView(), tag: 2, selection: $selection) {
                        Button {
                            viewModel.login(withEmail: email, password: password)
                            self.selection = 2
                        } label: {
                            Text("Sign In")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 340, height: 50)
                                .background(.green)
                                .clipShape(Capsule())
                        }
                        .shadow(color: .gray, radius: 1, x:0, y:4)
                        .padding(.bottom, 25)
                    }
                    
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
                    
                    NavigationLink (destination: SignUpView(), tag: 1, selection: $selection) {
                        Button {
                            print("sign up")
                            self.selection = 1
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
                }
                .padding(.horizontal, 40)
                
                Spacer()
                
            }
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}

