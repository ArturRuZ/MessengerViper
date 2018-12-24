//
//  Buffer.swift
//  TableView
//
//  Created by Артур on 19/12/2018.
//  Copyright © 2018 Ronte. All rights reserved.
//

import Foundation
// используется для передачи данных между контроллерами
protocol BufferProtocol {
    func sendbuffer(_ Chat: Chat)
    func getBuffer()-> (Chat?)
}


class Buffer : BufferProtocol{
    static let buffer = Buffer()
    var bufferObject: Chat?
    
    func sendbuffer(_ chat: Chat) {bufferObject = chat}
    
    func getBuffer()-> (Chat?){
        return bufferObject
    }
    
}
