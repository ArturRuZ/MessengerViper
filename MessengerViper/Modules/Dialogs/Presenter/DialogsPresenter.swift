//
//  DialogsPresenter.swift
//  MessengerViper
//
//  Created by Krasa on 22/12/2018.
//  Copyright © 2018 Ronte. All rights reserved.
//

import Foundation

class DialogsPresenter {
    private var presenterOutput: DialogsPresenterOutput!
    private weak var view: DialogsViewInput!
    private var interactor: DialogsInteractorInput!
}

extension DialogsPresenter: DialogsPresenterInput {
    var output: DialogsPresenterOutput {
        get {
            return presenterOutput
        }
        set {
            presenterOutput = newValue
        }
    }
    
    var viewInput: DialogsViewInput {
        get {
            return view
        }
        set {
            view = newValue
        }
    }
    
    var interactorInput: DialogsInteractorInput {
        get {
            return interactor
        }
        set {
            interactor = newValue
        }
    }
}

extension DialogsPresenter: DialogsListInteractorOutput {
    func recieved(dialogs: [Dialog]) {
        
    }
}
