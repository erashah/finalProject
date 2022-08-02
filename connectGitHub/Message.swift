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
    
    init(ifBot : Bool, text : String) {
        self.ifBot = ifBot
        self.text = text
    }
}
