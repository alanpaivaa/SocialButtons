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
            .openGraphMetaTag(named: "og:type", value: "music.radio_station"),
            .openGraphMetaTag(named: "og:audio", value: url)
        ]
        let creatorsTags: [Node<HTML.HeadContext>] = creatorsUrls.map { creatorUrl in
            .openGraphMetaTag(named: "music:creator", value: creatorUrl)
        }
        return .group(tags + creatorsTags)
    }
}
