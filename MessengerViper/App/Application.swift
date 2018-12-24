//
//  Application.swift
//  MessengerViper
//
//  Created by Krasa on 22/12/2018.
//  Copyright © 2018 Ronte. All rights reserved.
//

import UIKit

// MARK: - Properties

class Application {
    private let modulesCoordinator: ModulesCoordinator
    
    init() {
        modulesCoordinator = ModulesCoordinator()
    }
}

// MARK: - Initialization

extension Application {
    func fire() -> UIViewController {
        return modulesCoordinator.rootModuleController()
    }
}
