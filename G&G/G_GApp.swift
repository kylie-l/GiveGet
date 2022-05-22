//
//  G_GApp.swift
//  G&G
//
//  Created by Kylie Liang on 5/21/22.
//

import SwiftUI
import Firebase

@main
struct G_GApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            Login()
        }
    }
}
