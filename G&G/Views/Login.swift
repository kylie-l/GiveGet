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
    //@EnvironmentObject var answeredPrompt: Toggles
    
    var body: some View {
        
        NavigationView {
            //parent container
            VStack {
                Spacer()
                
                AuthHeadingV(title: "SIGN IN")
                    .padding(.bottom, 50)
                    .foregroundColor(Color("Text Dark Color"))
                    
                
                //details
                VStack(spacing: 25){
                    
                    CustomInputField(imageName: "envelope", placeholderText: "Enter Email", text: $email)
                        .padding(.leading, 35)
                        .padding(.trailing, 35)
                    CustomInputField(imageName: "lock", placeholderText: "Enter Password", text: $password)
                        .padding(.leading, 35)
                        .padding(.trailing, 35)
                    /*
                    Button {
                        viewModel.login(withEmail: email, password: password)
                        viewModel.answeredPrompt = false
                        self.selection = 2
                    } label: {
                        
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 340, height: 50)
                            .background(Color("Bold Green"))
                            .clipShape(Capsule())
                    */
                        Button {
                            viewModel.login(withEmail: email, password: password)
                            self.selection = 2
                        } label: {
                            Text("Sign In")
                                .font(.headline)
                                .foregroundColor(Color("Text Color"))
                                .frame(width: 340, height: 50)
                                .background(Color("Bold Green"))
                                .clipShape(Capsule())
                        }
                        .shadow(color: .gray, radius: 1, x:0, y:2)
                        .padding(.bottom, 25)

                    }
                    .shadow(color: .gray, radius: 1, x:0, y:1)
                    
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
                    .padding(.leading, 35)
                    .padding(.trailing, 35)
                    .foregroundColor(Color("Text Dark Color"))
                    
                    NavigationLink (destination: SignUpView(), tag: 1, selection: $selection) {
                        Button {
                            print("sign up")
                            self.selection = 1
                        } label: {
                            Text("Sign Up")
                                .font(.headline)
                                .foregroundColor(Color("Text Dark Color"))
                                .frame(width: 340, height: 50)
                                .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color("Bold Green"), lineWidth: 2))
                        }
                        .cornerRadius(25)
                    }
                .padding(.horizontal, 40)
                
                Spacer()
                
            }
            .padding(.top, 75)
            .ignoresSafeArea()
            .background(Color("Background Cream"))
        }

    }
}


struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}

