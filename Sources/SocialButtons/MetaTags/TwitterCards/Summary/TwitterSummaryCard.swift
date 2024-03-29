//
//  TwitterSummaryCard.swift
//  
//
//  Created by Alan Paiva on 7/23/23.
//

import Foundation
import Plot

public struct TwitterSummaryCard: MetaTaggableContent {
    private let title: String
    private let largeImage: Bool
    private let site: TwitterSite
    private let image: TwitterImage?
    private let creator: TwitterContentCreator?
    private let description: String?

    public init(title: String,
                largeImage: Bool,
                site: TwitterSite,
                image: TwitterImage? = nil,
                creator: TwitterContentCreator? = nil,
                description: String? = nil) {
        self.title = title
        self.largeImage = largeImage
        self.site = site
        self.image = image
        self.creator = creator
        self.description = description
    }

    public var metaTags: Node<HTML.HeadContext> {
        .group(
            .comment("Twitter Metadata"),
            .twitterMetaTag(name: "twitter:card", value: largeImage ? "summary_large_image" : "summary"),
            .twitterMetaTag(name: "twitter:title", value: title),
            .twitterMetaTag(name: "twitter:description", value: description),
            .metaContent(creator),
            .metaContent(site),
            .metaContent(image)
        )
    }
}
