//
//  OpenGraphImage.swift
//  
//
//  Created by Alan Paiva on 7/16/23.
//

import Foundation
import Plot

public struct OpenGraphImage: OpenGraphContent {
    private let url: String
    private let secureUrl: String?
    private let mimeType: String?
    private let size: CGSize?
    private let alt: String?

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

    var metaTags: Node<HTML.HeadContext> {
        .group(
            .openGraphMetaTag(named: "og:image", value: url),
            .openGraphMetaTag(named: "og:image:secure_url", value: secureUrl),
            .openGraphMetaTag(named: "og:image:type", value: mimeType),
            .unwrap(size, { imageSize in
                Node.group(
                    .openGraphMetaTag(named: "og:image:width", value: "\(Int(imageSize.width))"),
                    .openGraphMetaTag(named: "og:image:height", value: "\(Int(imageSize.height))")
                )
            }),
            .openGraphMetaTag(named: "og:image:alt", value: alt)
        )
    }
}
