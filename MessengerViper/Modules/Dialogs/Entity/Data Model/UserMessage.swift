//
//  UserMessage.swift
//  TableView
//
//  Created by Krasa on 15/12/2018.
//  Copyright © 2018 Ronte. All rights reserved.
//

import Foundation
import MessageKit

struct UserMessage {
    let messageId: String
    let user: User
    let text: String
    let date: Date
    
}
// добавлено для интеграции с UserMessageKit
extension UserMessage: MessageType {
    var sender: Sender {
        return Sender(id: user.name, displayName: user.name)
    }
    
    var sentDate: Date {
        return date
    }
    
    var kind: MessageKind {
        return .text(text)
    }
}
