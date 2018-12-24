//
//  ChatTableViewCell.swift
//  TableView
//
//  Created by Krasa on 15/12/2018.
//  Copyright © 2018 Ronte. All rights reserved.
//

import UIKit
import InitialsImageView

class ChatTableViewCell: UITableViewCell {
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var lastMessageDateLabel: UILabel!
    @IBOutlet weak var lastMessagerTextLabel: UILabel!
    
    var viewModel: ChatTableViewCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            avatarImageView.setImageForName(viewModel.userName,
                                            circular: true,
                                            textAttributes: nil)
            userNameLabel.text = viewModel.userName
            lastMessageDateLabel.text = viewModel.lastMessageDatePrettyPrinted
            lastMessagerTextLabel.text = viewModel.lastMessageTitle
        }
    }
}
