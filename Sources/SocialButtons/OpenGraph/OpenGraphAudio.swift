//
//  OpenGraphAudio.swift
//  
//
//  Created by Alan Paiva on 7/16/23.
//

import Foundation
import Plot

/// Description of Open Graph audio that complements the main metadata object
public struct OpenGraphAudio: OpenGraphContent {
    private let url: String
    private let secureUrl: String?
    private let mimeType: String?

    /// Initializer
    ///
    /// - Parameters:
    ///   - url: **og:audio**, url to the audio file
    ///   - secureUrl: **og:audio:secure_url**, an alternate url to use if the webpage requires HTTPS
    ///   - mimeType: **og:image:type**, a MIME type for this audio
    public init(url: String,
                secureUrl: String? = nil,
                mimeType: String? = nil) {
        self.url = url
        self.secureUrl = secureUrl
        self.mimeType = mimeType
    }

    public var metaTags: Node<HTML.HeadContext> {
        .group(
            .openGraphMetaTag(named: "og:audio", value: url),
            .openGraphMetaTag(named: "og:audio:secure_url", value: secureUrl),
            .openGraphMetaTag(named: "og:audio:type", value: mimeType)
        )
    }
}
