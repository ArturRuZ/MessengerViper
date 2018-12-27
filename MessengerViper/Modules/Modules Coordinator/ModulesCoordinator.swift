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
    
    private var dialogsView : UINavigationController?
    private var singleChatView : UINavigationController?
    private var dialogsPresenter : DialogsPresenterInput?
    private var singleChatPresenter : SingleChatPresenterInput?
    
    func rootModuleController() -> UIViewController {
        let dialogsAssembly = DialogsAssembly()
        guard let dialogs = dialogsAssembly.build() else { return UIViewController() }
        dialogs.presenter.output = self
        self.dialogsView = dialogs.controller
        self.dialogsPresenter = dialogs.presenter
        return dialogs.controller
    }
}

extension ModulesCoordinator {
    func singleChatModuleController() -> UIViewController{
        let singleChatAssembly = SingleChatAssembly()
        guard let singleChat = singleChatAssembly.build() else { return UIViewController() }
        singleChat.presenter.output = self
        self.singleChatView = singleChat.controller
        self.singleChatPresenter = singleChat.presenter
        return singleChat.controller
    }
}


extension ModulesCoordinator: DialogsPresenterOutput {
    func selected(dialog: Chat) {
        singleChatPresenter?.messagePresentFromDialogsVC(presentedMessages: dialog)
        dismissDialogsView()
        presentSingleChatView()
        print (dialog)
  
    }
}


extension ModulesCoordinator: SingleChatPresenterOutput {
    func chatWithNewMessages(dialog: Chat) {
        dismissSingleChatView()
        presentDialogsView()
        dialogsPresenter?.updateMessages(newMessages: dialog)
    }
}

extension ModulesCoordinator: RoutingDialogsView {
    func presentDialogsView() {
        guard let singleChatVC = singleChatView else {return}
        singleChatVC.present( dialogsView!, animated: true, completion: nil)
    }
    
    func dismissDialogsView() {
        guard let dialogsVC = dialogsView else {return}
        dialogsVC.dismiss(animated: true, completion: nil)
    }
}

extension ModulesCoordinator : RoutingSingleChatView {
    func presentSingleChatView() {
        guard let dialogsVC = dialogsView else {return}
        dialogsVC.present(singleChatView!, animated: true, completion: nil)
    }
    
    func dismissSingleChatView() {
        guard let singleChatVC = singleChatView else {return}
        singleChatVC.dismiss(animated: true, completion: nil)
    }

}
