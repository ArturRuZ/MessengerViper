//
//  SingleChatViewController.swift
//  MessengerViper
//
//  Created by Артур on 24/12/2018.
//  Copyright © 2018 Ronte. All rights reserved.
//


import Foundation
import MessageKit
import MessageInputBar
import UIKit
import Fakery
import InitialsImageView


class SingleChatViewController : MessagesViewController {
    
    
    private var presenter : SingleChatPresenterInput!
    
    //пользователь который отправил сообщение
    var sendDataUser : User!
    var avatarButton : AvatarView!
    var sendDataSource : Chat!
    let me : User = User(id:0, name: "my_name")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        messageInputBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.loadMessages()
        messagesCollectionView.reloadData()
    }
    
    @IBAction func goBack(_ sender: Any) {
        presenter?.newMessageInput(newMessages: sendDataSource)
    }
    
}


extension SingleChatViewController : MessagesDataSource {
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return sendDataSource.messages.count
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        sendDataUser = sendDataSource.messages[indexPath.section].user
        return sendDataSource.messages[indexPath.section]
    }
    
    func currentSender() -> Sender {
        return Sender(id: me.name , displayName: me.name)
    }
}


extension SingleChatViewController: MessagesDisplayDelegate, MessagesLayoutDelegate {
    func messageTopLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        return 15
    }
    
    func messageTopLabelAttributedText(for message: MessageType, at indexPath: IndexPath) -> NSAttributedString? {
        var MessageDate: String {
            let convertDate:String?
            let dateFormatterGet = DateFormatter()
            dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
            let dateFormatterPrint = DateFormatter()
            dateFormatterPrint.dateFormat = "HH:mm:ss"
            if let date = dateFormatterGet.date(from: message.sentDate.description){convertDate = dateFormatterPrint.string(from: date)
                return convertDate!
            } else { return ""}
        }
        
        return NSAttributedString(
            string: MessageDate,
            attributes: [.font: UIFont.systemFont(ofSize: 12)])
    }
    
    
    // конфигурация аватара
    func configureAvatarView(_ avatarView: AvatarView, for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) {
        let message = sendDataSource.messages[indexPath.section]
        avatarView.setImageForName(message.sender.displayName, circular: true, textAttributes: nil)
        //скрытие аватара
        avatarView.isHidden = false
        avatarButton = avatarView
    }
    
}

extension SingleChatViewController : MessageInputBarDelegate {
    func messageInputBar(_ inputBar: MessageInputBar, didPressSendButtonWith text: String){
        // при нажатии на кнопку создаем объект сообщение и добавляем его в присланный массив
        let faker = Faker()
        let user = me
        
        let inputMessage = UserMessage(messageId: "\(faker.number.randomInt())", user: user , text: text, date: Date())
        sendDataSource.messages.append(inputMessage)
        // обнуляем текстовое поле после вводы сообщения
        inputBar.inputTextView.text = ""
        // обновляем контроллер для корректного отображения данных
        messagesCollectionView.reloadData()
        // скролл контроллера в самый низ экрана
        messagesCollectionView.scrollToBottom(animated: true)
        
    }
}

extension SingleChatViewController : SingleChatViewInput {
    var presenterInput: SingleChatPresenterInput {
        get {
            return presenter
        }
        set {
            presenter = newValue
        }
    }
    
    func messagesPreview(dialog: Chat) {
        sendDataSource = dialog
        navigationItem.title = sendDataSource.userName
    }
}
