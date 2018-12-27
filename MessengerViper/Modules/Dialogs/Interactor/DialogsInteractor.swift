//
//  DialogsInteractor.swift
//  MessengerViper
//
//  Created by Krasa on 22/12/2018.
//  Copyright © 2018 Ronte. All rights reserved.
//

import Foundation

class DialogsInteractor {
    private var interactorOutput: DialogsListInteractorOutput!
    private var chatWithAllMessages: [Chat]!
}

extension DialogsInteractor: DialogsInteractorInput {
    var chatWithMessages: [Chat] {
        get {
            return chatWithAllMessages
        }
        set {
            chatWithAllMessages = newValue
        }
    }
    
    var output: DialogsListInteractorOutput {
        get {
            return interactorOutput
        }
        set {
            interactorOutput = newValue
        }
    }
    
    func getDialogs() {
       
        if chatWithAllMessages == nil {chatWithMessages = ChatFactory().fakeChats(number: 30)}
        interactorOutput?.recieved(dialogs: chatWithAllMessages )
    }
    
    func dialogsInput(newMessages: Chat) {
        for i in 0..<chatWithAllMessages.count {
            if (chatWithAllMessages[i].id == newMessages.id){
                chatWithMessages[i].messages = newMessages.messages}
        }
        interactorOutput?.recieved(dialogs: chatWithAllMessages)
    }
}
