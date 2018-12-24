//
//  SingleChatPresenterProtocol.swift
//  MessengerViper
//
//  Created by Артур on 24/12/2018.
//  Copyright © 2018 Ronte. All rights reserved.
//

import Foundation


protocol SingleChatPresenterInput: class {
    var output: SingleChatPresenterOutput { get set }
    var viewInput: SingleChatViewInput { get set }
    var interactorInput: SingleChatInteractorInput { get set }
    func messageInput()
}

protocol SingleChatPresenterOutput: class {
    func chatWithNewMessages(dialog: [Chat])
}