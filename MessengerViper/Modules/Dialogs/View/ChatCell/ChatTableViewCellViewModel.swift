//
//  ChatTableViewCellViewModel.swift
//  TableView
//
//  Created by Krasa on 15/12/2018.
//  Copyright © 2018 Ronte. All rights reserved.
//

import Foundation

protocol ChatTableViewCellViewModel {
    var userName: String { get }
    var lastMessageTitle: String { get }
    var lastMessageDatePrettyPrinted: String { get }
    
    
}
