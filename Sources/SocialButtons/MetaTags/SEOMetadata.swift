//
//  SEOMetadata.swift
//  
//
//  Created by Alan Paiva on 7/30/23.
//

import Foundation
import Plot

public struct SEOMetadata: MetaTaggableContent {
    private let title: String?
    private let description: String?
    private let imageUrl: String?
    private let charset: DocumentEncoding
    private let canonicalUrl: String?

    public init(title: String? = nil,
                description: String? = nil,
                imageUrl: String? = nil,
                charset: DocumentEncoding = .utf8,
                canonicalUrl: String? = nil) {
        self.title = title
        self.description = description
        self.imageUrl = imageUrl
        self.charset = charset
        self.canonicalUrl = canonicalUrl
    }

    public var metaTags: Node<HTML.HeadContext> {
        .group(
            .encoding(charset),
            .unwrap(title, { .element(named: "title", text: $0) }),
            .unwrap(canonicalUrl, { .link(.rel(.canonical), .href($0)) }),
            .metaTag(name: "description", content: description),
            .metaTag(name: "image", content: imageUrl)
        )
    }
}
