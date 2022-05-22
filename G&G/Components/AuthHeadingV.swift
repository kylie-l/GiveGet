//
//  AuthHeadingV.swift
//  G&G
//
//  Created by Kylie Liang on 5/21/22.
//

import SwiftUI

struct AuthHeadingV: View {
    let title: String
    
    var body: some View {
        //heading
        VStack {
            Text("GG")
                .font(.system(size: 150))
            Text(title)
                .font(.system(size: 50, weight: .regular, design: .default))
        }
        .frame(height: 200)
    }
}

struct AuthHeadingV_Previews: PreviewProvider {
    static var previews: some View {
        AuthHeadingV(title: "Sign In")
    }
}
