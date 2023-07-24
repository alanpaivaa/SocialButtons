//
//  File.swift
//  
//
//  Created by Alan Paiva on 7/23/23.
//

import Foundation
import Plot

public struct TwitterContentCreator: OpenGraphContent {
    private let username: String?
    private let id: String?

    public init(username: String? = nil, id: String? = nil) {
        self.username = username
        self.id = id
    }

    public init(account: TwitterAccount) {
        self.username = account.username
        self.id = account.id
    }

    public var metaTags: Node<HTML.HeadContext> {
        .group(
            .twitterMetaTag(named: "twitter:creator", value: username),
            .twitterMetaTag(named: "twitter:creator:id", value: id)
        )
    }
}
