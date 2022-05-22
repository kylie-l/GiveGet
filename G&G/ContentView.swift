//
//  ContentView.swift
//  G&G
//
//  Created by Kylie Liang on 5/21/22.
//

import SwiftUI

struct ContentView: View {
    @State var selectedIndex = 1
    
    let icons = [
        "book",
        "house",
        "envelope"
    ]

    var body: some View {
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
    
            Divider()
                .padding()
            
            //tab bar
            HStack {
                ForEach(0..<3, id: \.self) { number in
                    Spacer()
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}
