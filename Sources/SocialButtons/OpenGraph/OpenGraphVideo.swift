//
//  OpenGraphVideo.swift
//  
//
//  Created by Alan Paiva on 7/16/23.
//

import Foundation
import Plot

public struct OpenGraphVideo: OpenGraphContent {
    private let url: String
    private let secureUrl: String?
    private let mimeType: String?
    private let size: CGSize?
    
    public init(url: String,
                secureUrl: String? = nil,
                mimeType: String? = nil,
                size: CGSize? = nil) {
        self.url = url
        self.secureUrl = secureUrl
        self.mimeType = mimeType
        self.size = size
    }

    var metaTags: Node<HTML.HeadContext> {
        .group(
            .openGraphMetaTag(named: "og:video", value: url),
            .openGraphMetaTag(named: "og:video:secure_url", value: secureUrl),
            .openGraphMetaTag(named: "og:video:type", value: mimeType),
            .unwrap(size, { size in
                Node.group(
                    .openGraphMetaTag(named: "og:video:width", value: "\(Int(size.width))"),
                    .openGraphMetaTag(named: "og:video:height", value: "\(Int(size.height))")
                )
            })
        )
    }
}
