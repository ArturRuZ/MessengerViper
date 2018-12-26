//
//  ModulesCoordinator.swift
//  MessengerViper
//
//  Created by Krasa on 22/12/2018.
//  Copyright © 2018 Ronte. All rights reserved.
//

import UIKit
import MessageKit


class ModulesCoordinator {
    func rootModuleController() -> UIViewController {
        let dialogsAssembly = DialogsAssembly()
        guard let dialogs = dialogsAssembly.build() else { return UIViewController() }
       dialogs.presenter.output = self
        return dialogs.controller
    }
}

extension ModulesCoordinator: DialogsPresenterOutput {
    func selected(dialog: [Chat]) {
        
    }
}

extension ModulesCoordinator {
    
    func singleChatModuleController() -> UIViewController{
        let singleChatAssembly = SingleChatAssembly()
        guard let singleChat = singleChatAssembly.build() else { return UIViewController() }
        singleChat.presenter.output = self
        return singleChat.controller
    }
}

extension ModulesCoordinator: SingleChatPresenterOutput {
    func chatWithNewMessages(dialog: [Chat]) {
        
    }
    
    
}
