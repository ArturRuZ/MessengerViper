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

extension ModulesCoordinator: DialogsPresenterOutput {
    func selected(dialog: Chat) {
        singleChatPresenter?.messagePresent(presentedMessages: dialog)
        presentSingleChatView()
        print ("!!")
        print (dialogsView)
        print (singleChatView)
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

extension ModulesCoordinator: SingleChatPresenterOutput {
    func chatWithNewMessages(dialog: [Chat]) {
        
    }
}

extension ModulesCoordinator: RoutingDialogsView {
    func presentDialogsView() {
        let storyboard = UIStoryboard(name: "DialogsStoryboard", bundle: nil)
        let rootVC = storyboard.instantiateViewController(withIdentifier: "kDialogsNavigationControllerIdentifier")
        guard let navigationVC = rootVC as? UINavigationController,
            let dialogsVC = navigationVC.viewControllers.first as? DialogsViewController else {return}
        navigationVC.present(dialogsVC, animated: true, completion: nil)
        print (dialogsView)
    }
    
    func dismissDialogsView() {
       let dialogsVC = dialogsView?.viewControllers.first
       dialogsVC?.dismiss(animated: true, completion: nil)
    }
}

extension ModulesCoordinator : RoutingSingleChatView {
    func presentSingleChatView() {
        //guard let singleChatVC = singleChatView?.viewControllers.first as? SingleChatViewController else {return}
        
        print (singleChatView!)
        
    dialogsView!.present(singleChatView!, animated: true, completion: nil)
     
        
        // dialogsView!.pushViewController(singleChatView!, animated: true)
       // window.rootViewController = singleChatView
       // window.makeKeyAndVisible()
    }
    
    func dismissSingleChatView() {
        
    }
    
    
}
