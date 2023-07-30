//
//  TwitterImage.swift
//  
//
//  Created by Alan Paiva on 7/23/23.
//

import Foundation
import Plot

public struct TwitterImage: MetaTaggableContent {
    let url: String
    let alt: String?

    public init(url: String, alt: String? = nil) {
        self.url = url
        self.alt = alt
    }

    public var metaTags: Node<HTML.HeadContext> {
        .group(
            .twitterMetaTag(named: "twitter:image", value: url),
            .twitterMetaTag(named: "twitter:image:alt", value: alt)
        )
    }
}
