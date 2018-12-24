//
//  DialogsAssembly.swift
//  MessengerViper
//
//  Created by Krasa on 22/12/2018.
//  Copyright © 2018 Ronte. All rights reserved.
//

import UIKit

class DialogsAssembly {
    func build() -> (controller: UIViewController, presenter: DialogsPresenterInput)? {
        let storyboard = UIStoryboard(name: "DialogsStoryboard", bundle: nil)
        let rootVC = storyboard.instantiateViewController(withIdentifier: "kDialogsNavigationControllerIdentifier")
        guard let navigationVC = rootVC as? UINavigationController,
              let dialogsVC = navigationVC.viewControllers.first as? DialogsViewController else { return nil }
        
        let presenter = DialogsPresenter()
        let interactor = DialogsInteractor()
        
        dialogsVC.presenterInput = presenter
        presenter.interactorInput = interactor
        presenter.viewInput = dialogsVC
        interactor.output = presenter
        
        return (controller: navigationVC, presenter: presenter)
    }
}
