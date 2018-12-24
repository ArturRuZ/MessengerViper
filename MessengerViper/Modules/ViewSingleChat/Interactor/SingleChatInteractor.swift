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
}

extension SingleChatInteractor : SingleChatInteractorInput{
    var output: SingleChatMessagesInteractorOutput {
        get {
            // cвязать с презентером 
            return interactorOutput
        }
        set {
            interactorOutput = newValue
        }
    }
    
    func messageInput() {
        
    }
    
    
}
