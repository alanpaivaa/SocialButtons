//
//  TwitterPlayerSize.swift
//  
//
//  Created by Alan Paiva on 7/23/23.
//

import Foundation
import Plot

public struct TwitterPlayerSize: MetaTaggableContent {
    private let width: Int
    private let height: Int

    public init(width: Int, height: Int) {
        self.width = width
        self.height = height
    }

    public var metaTags: Node<HTML.HeadContext> {
        .group(
            .twitterMetaTag(name: "twitter:player:width", value: width),
            .twitterMetaTag(name: "twitter:player:height", value: height)
        )
    }
}
