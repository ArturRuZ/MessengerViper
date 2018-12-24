//
//  SingleChatViewControllerProtocol.swift
//  MessengerViper
//
//  Created by Артур on 24/12/2018.
//  Copyright © 2018 Ronte. All rights reserved.
//

import Foundation


protocol SingleChatViewInput: class {
    var presenterInput: SingleChatPresenterInput { get set }
    func messagesPreview(dialogs: [UserMessage])
}
