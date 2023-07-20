//
//  OpenGraphTypePlaylist.swift
//  
//
//  Created by Alan Paiva on 7/17/23.
//

import Foundation
import Plot

public struct OpenGraphTypePlaylist: OpenGraphContent {
    private let songUrls: [String]
    private let disc: Int?
    private let track: Int?
    private let creatorUrls: [String]

    public init(songUrls: [String] = [],
                disc: Int? = nil,
                track: Int? = nil,
                creatorUrls: [String] = []) {
        self.songUrls = songUrls
        self.disc = disc
        self.track = track
        self.creatorUrls = creatorUrls
    }

    var metaTags: Node<HTML.HeadContext> {
        let tags: [Node<HTML.HeadContext>] = [
            .openGraphMetaTag(named: "og:type", value: "music.playlist"),
            .openGraphMetaTag(named: "music:song:disc", value: disc),
            .openGraphMetaTag(named: "music:song:track", value: track)
        ]
        let songTags: [Node<HTML.HeadContext>] = songUrls.map { songUrl in
            .openGraphMetaTag(named: "music:song", value: songUrl)
        }
        let creatorTags: [Node<HTML.HeadContext>] = creatorUrls.map { creatorUrl in
            .openGraphMetaTag(named: "music:creator", value: creatorUrl)
        }
        return .group(tags + songTags + creatorTags)
    }
}
