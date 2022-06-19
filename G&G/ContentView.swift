//
//  ContentView.swift
//  G&G
//
//  Created by Kylie Liang on 5/21/22.
//

import SwiftUI

struct ContentView: View {
    @State var selectedIndex = 1
    //@EnvironmentObject var answered: Toggles
    @EnvironmentObject var viewModel: AuthViewModel
    
    let icons = [
        "book",
        "house",
        "envelope"
    ]

    var body: some View {
        Group {
            //no user logged in
            if viewModel.userSession == nil {
                Login()
            }
            else { //have logged in user
                if let user = viewModel.currentUser {
                    if user.answered == false { //answeredprompt
                        let _ = print("Hi")
                        AnswerPromptView()
                    }
                    else {
                        mainInterfaceView
                        let _ = print("Hio")
                    }
                    let _ = print(user.answered)
                }
                let _ = print("Hv")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .previewInterfaceOrientation(.portrait)
    }
}

extension ContentView {
    var mainInterfaceView: some View {
        VStack {
            //Content
            ZStack {
                switch selectedIndex {
                case 0:
                    JournalView()
                case 1:
                    HomeView()
                default:
                    MessagesView()
                }
            }
            //.ignoresSafeArea()
    
           // Divider()
               // .padding(.horizontal)
            
            //tab bar
            HStack {
                Spacer()
                ForEach(0..<3, id: \.self) { number in
                    Button(action: {
                        self.selectedIndex = number
                    }, label: {
                        Image(systemName: icons[number])
                            .font(.system(size: 25,
                                          weight: .regular,
                                          design: .default))
                            .foregroundColor(selectedIndex == number ? .orange : .black)
                    })
                    Spacer()
                }
            }
        }
        .background(Color("Accent Green"))
    }
}
