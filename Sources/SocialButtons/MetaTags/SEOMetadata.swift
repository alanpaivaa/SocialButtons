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

    public init(title: String? = nil,
                description: String? = nil,
                imageUrl: String? = nil,
                charset: DocumentEncoding = .utf8) {
        self.title = title
        self.description = description
        self.imageUrl = imageUrl
        self.charset = charset
    }

    public var metaTags: Node<HTML.HeadContext> {
        .group(
            .encoding(charset),
            .unwrap(title, { .element(named: "title", text: $0) }),
            .metaTag(name: "description", content: description),
            .metaTag(name: "image", content: description)
        )
    }
}
