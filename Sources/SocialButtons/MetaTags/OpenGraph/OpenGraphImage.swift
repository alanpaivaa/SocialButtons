//
//  OpenGraphImage.swift
//  
//
//  Created by Alan Paiva on 7/16/23.
//

import Foundation
import Plot

/// An image URL which should represent your object within the graph
public struct OpenGraphImage: MetaTaggableContent {
    private let url: String
    private let secureUrl: String?
    private let mimeType: String?
    private let size: CGSize?
    private let alt: String?

    /// Initializer
    ///
    /// - Parameters:
    ///   - url: **og:image**, url to the image
    ///   - secureUrl: **og:image:secure_url**, an alternate url to use if the webpage requires HTTPS
    ///   - mimeType: **og:image:type**, a MIME type for this image
    ///   - size: **og:image:width**, **og:image:height**, the size of the image in pixels
    ///   - alt: **og:image:alt**, a description of what is in the image
    public init(url: String,
                secureUrl: String? = nil,
                mimeType: String? = nil,
                size: CGSize? = nil,
                alt: String? = nil) {
        self.url = url
        self.secureUrl = secureUrl
        self.mimeType = mimeType
        self.size = size
        self.alt = alt
    }

    public var metaTags: Node<HTML.HeadContext> {
        .group(
            .openGraphMetaTag(property: "og:image", content: url),
            .openGraphMetaTag(property: "og:image:secure_url", content: secureUrl),
            .openGraphMetaTag(property: "og:image:type", content: mimeType),
            .unwrap(size, { imageSize in
                Node.group(
                    .openGraphMetaTag(property: "og:image:width", content: "\(Int(imageSize.width))"),
                    .openGraphMetaTag(property: "og:image:height", content: "\(Int(imageSize.height))")
                )
            }),
            .openGraphMetaTag(property: "og:image:alt", content: alt)
        )
    }
}
