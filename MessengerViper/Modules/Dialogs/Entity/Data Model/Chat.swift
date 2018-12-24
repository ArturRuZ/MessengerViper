//
//  Chat.swift
//  TableView
//
//  Created by Krasa on 15/12/2018.
//  Copyright © 2018 Ronte. All rights reserved.
//

import Foundation

struct Chat {
    let id: Int
    let user: User
    var messages: [UserMessage]
    
    var prettyDescription: String {
        return user.name + "  " + (messages.last?.text ?? "")
    }
}

extension Chat: ChatTableViewCellViewModel {
    var userName: String {
        return user.name
    }
    
    var lastMessageTitle: String {
        return messages.last?.text ?? ""
    }
    
    // TODO: - дата переведена в нужный вид
    
    var lastMessageDatePrettyPrinted: String {
        let convertDate:String?
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "HH:mm:ss"
        if let date = dateFormatterGet.date(from: messages.last?.date.description ?? ""){convertDate = dateFormatterPrint.string(from: date)
            return convertDate!
        } else { return ""}
       
        
 
       
    }
}
