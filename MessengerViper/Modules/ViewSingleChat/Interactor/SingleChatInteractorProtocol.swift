//
//  SingleChatInteractorProtocol.swift
//  MessengerViper
//
//  Created by Артур on 24/12/2018.
//  Copyright © 2018 Ronte. All rights reserved.
//

import Foundation

protocol  SingleChatInteractorInput: class {
    var output: SingleChatMessagesInteractorOutput { get set }
    func messageInput()
}
protocol  SingleChatMessagesInteractorOutput: class {
    func chatWithNewMessages(dialog: [Chat])
}
