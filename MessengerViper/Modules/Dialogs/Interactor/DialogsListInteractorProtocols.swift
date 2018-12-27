//
//  DialogsListInteractorProtocols.swift
//  MessengerViper
//
//  Created by Krasa on 22/12/2018.
//  Copyright © 2018 Ronte. All rights reserved.
//

import Foundation

protocol  DialogsInteractorInput: class {
    var output: DialogsListInteractorOutput { get set }
    var chatWithMessages : [Chat] {get set}
    func getDialogs()
    func dialogsInput(newMessages: Chat)
}

protocol DialogsListInteractorOutput: class {
    func recieved(dialogs: [Chat])
}
