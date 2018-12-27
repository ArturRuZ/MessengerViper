//
//  SingleChatInteractorProtocol.swift
//  MessengerViper
//
//  Created by Артур on 24/12/2018.
//  Copyright © 2018 Ronte. All rights reserved.
//

import Foundation

protocol  SingleChatInteractorInput: class {
    var presentedMsg : Chat {get set}
    var output: SingleChatMessagesInteractorOutput { get set }
    func messageInput(presentedMessages: Chat)
     func loadMessages()
}
protocol  SingleChatMessagesInteractorOutput: class {
    func chatWithNewMessages(dialog: Chat)
   
}
