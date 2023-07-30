//
//  OpenGraphTypeRadioStation.swift
//  
//
//  Created by Alan Paiva on 7/17/23.
//

import Foundation
import Plot

/// Additional tags for the `music.radio_station` type, see ``OpenGraphType``
public struct OpenGraphTypeRadioStation: MetaTaggableContent {
    private let url: String?
    private let creatorsUrls: [String]

    /// Initializer
    ///
    /// - Parameters:
    ///   - url: **og:audio**, URL to this radio station
    ///   - creatorsUrls: **music:creator**, the creator of this playlist
    public init(url: String? = nil,
                creatorsUrls: [String] = []) {
        self.url = url
        self.creatorsUrls = creatorsUrls
    }

    public var metaTags: Node<HTML.HeadContext> {
        let tags: [Node<HTML.HeadContext>] = [
            .openGraphMetaTag(name: "og:type", content: "music.radio_station"),
            .openGraphMetaTag(name: "og:audio", content: url)
        ]
        let creatorsTags: [Node<HTML.HeadContext>] = creatorsUrls.map { creatorUrl in
            .openGraphMetaTag(name: "music:creator", content: creatorUrl)
        }
        return .group(tags + creatorsTags)
    }
}
