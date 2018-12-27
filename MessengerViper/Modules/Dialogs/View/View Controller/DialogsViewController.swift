//
//  DialogsViewController.swift
//  MessengerViper
//
//  Created by Krasa on 22/12/2018.
//  Copyright © 2018 Ronte. All rights reserved.
//

import UIKit


class DialogsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var presenter: DialogsPresenterInput!
    private let kChatTableViewCellNib = UINib(nibName: "ChatTableViewCell", bundle: nil)
    private let kChatTableViewCellReuseIdentifier = "kChatTableViewCellReuseIdentifier"
    private var chats : [Chat]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.loadMessages()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.loadMessages()
    }
}


extension DialogsViewController {
    private func setUpUI() {
        tableView.register(kChatTableViewCellNib, forCellReuseIdentifier: kChatTableViewCellReuseIdentifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 64
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - UITableViewDataSource Implementation

extension DialogsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: kChatTableViewCellReuseIdentifier,
                                                       for: indexPath) as? ChatTableViewCell else {
                                                        return UITableViewCell()
        }
        cell.viewModel = chats[indexPath.row]
        return cell
    }
}

// MARK: - UITableViewDelegate Implementation

extension DialogsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.selected(dialog: chats[indexPath.row])
    }
}


extension DialogsViewController: DialogsViewInput {
    var presenterInput: DialogsPresenterInput {
        get {
            return presenter
        }
        set {
            presenter = newValue
        }
    }
    
    func chatsPreview(dialogs: [Chat]) {
        if chats == nil {
            chats = dialogs
            setUpUI() }
        else {
            chats = dialogs
            tableView.reloadData()
        }
        
    }
}
