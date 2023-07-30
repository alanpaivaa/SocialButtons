//
//  OpenGraphTypeArticle.swift
//  
//
//  Created by Alan Paiva on 7/21/23.
//

import Foundation
import Plot

/// Additional tags for the `profile` type, see ``OpenGraphType``
public struct OpenGraphTypeArticle: MetaTaggableContent {
    private let publishedTime: Date?
    private let modifiedTime: Date?
    private let expirationTime: Date?
    private let authorsUrls: [String]
    private let section: String?
    private let tags: [String]

    /// Initializer
    ///
    /// - Parameters:
    ///   - publishedTime: **article:published_time**, when the article was first published
    ///   - modifiedTie: **article:modified_time**, when the article was last changed
    ///   - expirationTime: **article:expiration_time**, when the article is out of date after
    ///   - authorsUrls: **article:author**, writers of the article
    ///   - section: **article:section**, a high-level section name
    ///   - tags: **article:tag**, tag words associated with this article
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

    public var metaTags: Node<HTML.HeadContext> {
        let nodes: [Node<HTML.HeadContext>] = [
            .openGraphMetaTag(name: "og:type", content: "article"),
            .openGraphMetaTag(name: "article:published_time", content: publishedTime?.iso8601DateTimeFormatted()),
            .openGraphMetaTag(name: "article:modified_time", content: modifiedTime?.iso8601DateTimeFormatted()),
            .openGraphMetaTag(name: "article:expiration_time", content: expirationTime?.iso8601DateTimeFormatted()),
            .openGraphMetaTag(name: "article:section", content: section)
        ]
        let authorsNodes: [Node<HTML.HeadContext>] = authorsUrls.map { authorUrl in
            .openGraphMetaTag(name: "article:author", content: authorUrl)
        }
        let tagsNodes: [Node<HTML.HeadContext>] = self.tags.map { tag in
            .openGraphMetaTag(name: "article:tag", content: tag)
        }
        return .group(nodes + authorsNodes + tagsNodes)
    }
}
