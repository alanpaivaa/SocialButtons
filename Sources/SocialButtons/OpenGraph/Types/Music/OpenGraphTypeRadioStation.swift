//
//  OpenGraphTypeRadioStation.swift
//  
//
//  Created by Alan Paiva on 7/17/23.
//

import Foundation
import Plot

public struct OpenGraphTypeRadioStation: OpenGraphContent {
    private let url: String?
    private let creatorUrls: [String]
    
    public init(url: String? = nil, creatorUrls: [String] = []) {
        self.url = url
        self.creatorUrls = creatorUrls
    }

    var metaTags: Node<HTML.HeadContext> {
        let tags: [Node<HTML.HeadContext>] = [
            .openGraphMetaTag(named: "og:type", value: "music.radio_station"),
            .openGraphMetaTag(named: "og:audio", value: url)
        ]
        let creatorTags: [Node<HTML.HeadContext>] = creatorUrls.map { creatorUrl in
            .openGraphMetaTag(named: "music:creator", value: creatorUrl)
        }
        return .group(tags + creatorTags)
    }
}
