//
//  OpenGraphTypeBook.swift
//  
//
//  Created by Alan Paiva on 7/21/23.
//

import Foundation
import Plot

/// Additional tags for the `book` type, see ``OpenGraphType``
public struct OpenGraphTypeBook: MetaTaggableContent {
    private let authorsUrls: [String]
    private let isbn: String?
    private let releaseDate: Date?
    private let tags: [String]

    /// Initializer
    ///
    /// - Parameters:
    ///   - authorsUrls: **book:author**, who wrote this book
    ///   - isbn: **book:isbn**, the ISBN
    ///   - releaseDate: **book:release_date**, the date the book was released
    ///   - tags: **book:tag**, tag words associated with this book
    public init(authorsUrls: [String] = [],
                isbn: String? = nil,
                releaseDate: Date? = nil,
                tags: [String] = []) {
        self.authorsUrls = authorsUrls
        self.isbn = isbn
        self.releaseDate = releaseDate
        self.tags = tags
    }

    public var metaTags: Node<HTML.HeadContext> {
        let nodes: [Node<HTML.HeadContext>] = [
            .openGraphMetaTag(named: "og:type", value: "book"),
            .openGraphMetaTag(named: "book:isbn", value: isbn),
            .openGraphMetaTag(named: "book:release_date", value: releaseDate?.iso8601DateFormatted())
        ]
        let authorsNodes: [Node<HTML.HeadContext>] = authorsUrls.map { authorUrl in
            .openGraphMetaTag(named: "book:author", value: authorUrl)
        }
        let tagsNodes: [Node<HTML.HeadContext>] = tags.map { tag in
            .openGraphMetaTag(named: "book:tag", value: tag)
        }
        return .group(nodes + authorsNodes + tagsNodes)
    }
}
