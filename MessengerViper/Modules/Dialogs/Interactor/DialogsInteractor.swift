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
}

extension DialogsInteractor: DialogsInteractorInput {
    var output: DialogsListInteractorOutput {
        get {
            return interactorOutput
        }
        set {
            interactorOutput = newValue
        }
    }
    
    func getDialogs() {
        
    }
}
