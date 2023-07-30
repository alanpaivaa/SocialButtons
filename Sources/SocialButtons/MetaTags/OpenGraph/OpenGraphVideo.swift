//
//  OpenGraphVideo.swift
//  
//
//  Created by Alan Paiva on 7/16/23.
//

import Foundation
import Plot

/// Describes a video file that complements the main metadata object
public struct OpenGraphVideo: MetaTaggableContent {
    private let url: String
    private let secureUrl: String?
    private let mimeType: String?
    private let size: CGSize?

    /// Initializer
    ///
    /// - Parameters:
    ///   - url: **og:video**, url to the video file
    ///   - secureUrl: **video:series**, an alternate url to use if the webpage requires HTTPS
    ///   - mimeType:**video:type**, a MIME type for this video
    ///   - size: **og:video:width**, **og:video:height**, the size of the video in pixels
    public init(url: String,
                secureUrl: String? = nil,
                mimeType: String? = nil,
                size: CGSize? = nil) {
        self.url = url
        self.secureUrl = secureUrl
        self.mimeType = mimeType
        self.size = size
    }

    public var metaTags: Node<HTML.HeadContext> {
        .group(
            .openGraphMetaTag(name: "og:video", content: url),
            .openGraphMetaTag(name: "og:video:secure_url", content: secureUrl),
            .openGraphMetaTag(name: "og:video:type", content: mimeType),
            .unwrap(size, { size in
                Node.group(
                    .openGraphMetaTag(name: "og:video:width", content: "\(Int(size.width))"),
                    .openGraphMetaTag(name: "og:video:height", content: "\(Int(size.height))")
                )
            })
        )
    }
}
