//
//  SingleChatInteractor.swift
//  MessengerViper
//
//  Created by Артур on 24/12/2018.
//  Copyright © 2018 Ronte. All rights reserved.
//

import Foundation


class SingleChatInteractor {
    private var interactorOutput: SingleChatMessagesInteractorOutput!
    private var presentedMessages : Chat!
}

extension SingleChatInteractor : SingleChatInteractorInput{
 
    var presentedMsg: Chat {
        get {
            return presentedMessages
        }
        set {
            presentedMessages = newValue
        }
    }
    
    var output: SingleChatMessagesInteractorOutput {
        get {
            return interactorOutput
        }
        set {
            interactorOutput = newValue
        }
    }
    
    func messageInput(presentedMessages: Chat) {
       self.presentedMessages =  presentedMessages
    }
    
    func loadMessages() {
    interactorOutput.chatWithNewMessages(dialog: presentedMessages)
    }
    
    
    
    func messageInput() {
  
    }
    
    
}
