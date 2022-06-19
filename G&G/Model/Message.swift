//
//  Message.swift
//  G&G
//
//  Created by Michael Liu on 6/18/22.
//

import SwiftUI

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}

