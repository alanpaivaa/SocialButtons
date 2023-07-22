//
//  OpenGraphTypeArticle.swift
//  
//
//  Created by Alan Paiva on 7/21/23.
//

import Foundation
import Plot

public struct OpenGraphTypeArticle: OpenGraphContent {
    private let publishedTime: Date?
    private let modifiedTime: Date?
    private let expirationTime: Date?
    private let authorsUrls: [String]
    private let section: String?
    private let tags: [String]

    public init(publishedTime: Date? = nil,
                modifiedTime: Date? = nil,
                expirationTime: Date? = nil,
                authorsUrls: [String] = [],
                section: String? = nil,
                tags: [String] = []) {
        self.publishedTime = publishedTime
        self.modifiedTime = modifiedTime
        self.expirationTime = expirationTime
        self.authorsUrls = authorsUrls
        self.section = section
        self.tags = tags
    }

    var metaTags: Node<HTML.HeadContext> {
        let nodes: [Node<HTML.HeadContext>] = [
            .openGraphMetaTag(named: "og:type", value: "article"),
            .openGraphMetaTag(named: "article:published_time", value: publishedTime?.iso8601DateTimeFormatted()),
            .openGraphMetaTag(named: "article:modified_time", value: modifiedTime?.iso8601DateTimeFormatted()),
            .openGraphMetaTag(named: "article:expiration_time", value: expirationTime?.iso8601DateTimeFormatted()),
            .openGraphMetaTag(named: "article:section", value: section)
        ]
        let authorsNodes: [Node<HTML.HeadContext>] = authorsUrls.map { authorUrl in
            .openGraphMetaTag(named: "article:author", value: authorUrl)
        }
        let tagsNodes: [Node<HTML.HeadContext>] = self.tags.map { tag in
            .openGraphMetaTag(named: "article:tag", value: tag)
        }
        return .group(nodes + authorsNodes + tagsNodes)
    }
}
