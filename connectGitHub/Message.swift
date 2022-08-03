//
//  Message.swift
//  connectGitHub
//
//  Created by Scholar on 8/2/22.
//

import Foundation

class Message{
    var ifBot = true
    var text = ""
    var delayed = 0
    
    init(ifBot : Bool, text : String) {
        self.ifBot = ifBot
        self.text = text
    }
    init(ifBot : Bool, text : String, delayed : Int) {
        self.ifBot = ifBot
        self.text = text
        self.delayed = delayed
    }
}
