//
//  ChatFactory.swift
//  TableView
//
//  Created by Krasa on 15/12/2018.
//  Copyright © 2018 Ronte. All rights reserved.
//

import Foundation
import Fakery

class ChatFactory {
    func fakeChats(number: Int) -> [Chat] {
        var outArray = [Chat]()
        let faker = Faker()
        for _ in 0..<number {
            let user = User(id: faker.number.randomInt(), name: faker.name.firstName() + " " + faker.name.lastName())
            let messages = fakeUserMessages(user: user, number: faker.number.randomInt(min: 10, max: 20))
            let chat = Chat(id: faker.number.randomInt(), user: user, messages: messages)
            outArray.append(chat)
        }
        outArray.sort { $0.messages.last?.date ?? Date() < $1.messages.last?.date ?? Date() }
        return outArray
    }
    
    func fakeUserMessages(user: User, number: Int) -> [UserMessage] {
        var outArray = [UserMessage]()
        let faker = Faker()
        for _ in 0..<number {
            let message = UserMessage(messageId:"\(faker.number.randomInt())", user: user,
                                      text: faker.lorem.sentence(),
                                      date: Date(timeInterval: -faker.number.randomDouble(), since: Date()))
            outArray.append(message)
        }
        outArray.sort { $0.date > $1.date }
        return outArray
    }
}
