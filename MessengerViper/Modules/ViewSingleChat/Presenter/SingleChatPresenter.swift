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
