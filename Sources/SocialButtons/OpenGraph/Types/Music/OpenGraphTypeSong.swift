//
//  OpenGraphTypeSong.swift
//  
//
//  Created by Alan Paiva on 7/17/23.
//

import Foundation
import Plot

public struct OpenGraphTypeSong: OpenGraphContent {
    private let duration: Int?
    private let albumUrls: [String]
    private let disc: Int?
    private let track: Int?
    private let musicianUrls: [String]

    public init(duration: Int? = nil,
                albumUrls: [String] = [],
                disc: Int? = nil,
                track: Int? = nil,
                musicianUrls: [String] = []) {
        self.duration = duration
        self.albumUrls = albumUrls
        self.disc = disc
        self.track = track
        self.musicianUrls = musicianUrls
    }

    var metaTags: Node<HTML.HeadContext> {
        let tags: [Node<HTML.HeadContext>] = [
            .openGraphMetaTag(named: "og:type", value: "music.song"),
            .openGraphMetaTag(named: "music:duration", value: duration),
            .openGraphMetaTag(named: "music:album:disc", value: disc),
            .openGraphMetaTag(named: "music:album:track", value: track)
        ]
        let albumTags: [Node<HTML.HeadContext>] = albumUrls.map { albumUrl in
            .openGraphMetaTag(named: "music:album", value: albumUrl)
        }
        let musicianTags: [Node<HTML.HeadContext>] = musicianUrls.map { musicianUrl in
            .openGraphMetaTag(named: "music:musician", value: musicianUrl)
        }
        return .group(tags + albumTags + musicianTags)
    }
}
