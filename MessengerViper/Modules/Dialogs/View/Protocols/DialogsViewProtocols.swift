//
//  DialogsViewProtocols.swift
//  MessengerViper
//
//  Created by Krasa on 22/12/2018.
//  Copyright © 2018 Ronte. All rights reserved.
//

import Foundation

protocol DialogsViewInput: class {
    var presenterInput: DialogsPresenterInput { get set }
    func chatsPreview(dialogs: [Chat]) 
}

protocol RoutingDialogsView: class {
    func presentDialogsView()
    func dismissDialogsView()
}
