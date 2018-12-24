//
//  DialogsPresenterProtocols.swift
//  MessengerViper
//
//  Created by Krasa on 22/12/2018.
//  Copyright © 2018 Ronte. All rights reserved.
//

import Foundation

protocol DialogsPresenterInput: class {
    var output: DialogsPresenterOutput { get set }
    var viewInput: DialogsViewInput { get set }
    var interactorInput: DialogsInteractorInput { get set }
    func firstRun()
}

protocol DialogsPresenterOutput: class {
    func selected(dialog: [Chat])
}

