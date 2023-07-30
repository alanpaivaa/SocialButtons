//
//  TwitterPlayerCard.swift
//  
//
//  Created by Alan Paiva on 7/23/23.
//

import Foundation
import Plot

public struct TwitterPlayerCard: MetaTaggableContent {
    private let title: String
    private let url: String
    private let size: TwitterPlayerSize
    private let image: TwitterImage
    private let site: TwitterSite
    private let rawFileUrl: String?
    private let description: String?

    public init(title: String,
                url: String,
                size: TwitterPlayerSize,
                image: TwitterImage,
                site: TwitterSite,
                rawFileUrl: String? = nil,
                description: String? = nil) {
        self.title = title
        self.url = url
        self.size = size
        self.image = image
        self.site = site
        self.rawFileUrl = rawFileUrl
        self.description = description
    }

    public var metaTags: Node<HTML.HeadContext> {
        .group(
            .twitterMetaTag(name: "twitter:card", value: "player"),
            .twitterMetaTag(name: "twitter:title", value: title),
            .twitterMetaTag(name: "twitter:player", value: url),
            .twitterMetaTag(name: "twitter:player:stream", value: rawFileUrl),
            .twitterMetaTag(name: "twitter:description", value: description),
            .metaContent(size),
            .metaContent(site),
            .metaContent(image)
        )
    }
}
