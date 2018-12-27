//
//  SingleChatPresenter.swift
//  MessengerViper
//
//  Created by Артур on 24/12/2018.
//  Copyright © 2018 Ronte. All rights reserved.
//

import Foundation

class SingleChatPresenter {
    // вывод от презентера
    private var presenterOutput: SingleChatPresenterOutput!
    // вью для вывода данных из призентера
    private weak var view: SingleChatViewInput!
    // интерактор для презентера
    private var interactor: SingleChatInteractorInput!
    
}


extension SingleChatPresenter: SingleChatPresenterInput {
   
    var output: SingleChatPresenterOutput {
        get {
            return presenterOutput
        }
        set {
            presenterOutput = newValue
        }
    }
    
    var viewInput: SingleChatViewInput {
        get {
            return view
        }
        set {
            view = newValue
        }
    }
    
    var interactorInput: SingleChatInteractorInput {
        get {
            return interactor
        }
        set {
            interactor = newValue
        }
    }
}

extension SingleChatPresenter : SingleChatMessagesInteractorOutput {
    func chatWithNewMessages(dialog: Chat) {
       view?.messagesPreview(dialog: dialog)
    }
    
}
extension SingleChatPresenter {
    func messageInput() {
        
    }
    func messagePresent(presentedMessages : Chat ) {
        interactor?.messageInput(presentedMessages: presentedMessages)
    }
    
    func loadMessages() {
        interactor?.loadMessages()
    }
}
