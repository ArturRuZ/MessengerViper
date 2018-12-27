//
//  SingleChatAsembly.swift
//  MessengerViper
//
//  Created by Артур on 24/12/2018.
//  Copyright © 2018 Ronte. All rights reserved.
//

import Foundation
import UIKit



// сборка модуля
class SingleChatAssembly {
    func build() -> (controller: UINavigationController, presenter: SingleChatPresenterInput)? {
        let storyboard = UIStoryboard(name: "SingleChatStoryboard", bundle: nil)
        let rootVC = storyboard.instantiateViewController(withIdentifier: "kSingleChatNavigationControllerIdentifier")
        guard let navigationVC = rootVC as? UINavigationController,
            let SingleChatVC = navigationVC.viewControllers.first as? SingleChatViewController else { return nil }
        
        let presenter = SingleChatPresenter()
        let interactor = SingleChatInteractor()
        
        SingleChatVC.presenterInput = presenter
        presenter.interactorInput = interactor
        presenter.viewInput = SingleChatVC
        interactor.output = presenter
        print ("контроллер создан")
        return (controller: navigationVC, presenter: presenter)
    }
}
