//
//  TwitterAccount.swift
//  
//
//  Created by Alan Paiva on 7/23/23.
//

import Foundation

public struct TwitterAccount {
    let username: String
    let id: String?

    public init(username: String, id: String? = nil) {
        self.username = username
        self.id = id
    }
}
