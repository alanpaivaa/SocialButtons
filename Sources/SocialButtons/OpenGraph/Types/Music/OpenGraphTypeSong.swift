//
//  OpenGraphTypeSong.swift
//  
//
//  Created by Alan Paiva on 7/17/23.
//

import Foundation
import Plot

/// Additional tags for the `music.song` type, see ``OpenGraphType``
public struct OpenGraphTypeSong: OpenGraphContent {
    private let duration: Int?
    private let albumUrls: [String]
    private let disc: Int?
    private let track: Int?
    private let musicianUrls: [String]

    /// Initializer
    ///
    /// - Parameters:
    ///   - duration: **music:duration**, the song's length in seconds
    ///   - albumUrls: **music:album** , the albums this song is from
    ///   - disc: **music:album:disc**, which disc of the album this song is on
    ///   - track: **music:album:track**, which track this song is
    ///   - musicianUrls: **music:musician**, the musician that made this song
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

    public var metaTags: Node<HTML.HeadContext> {
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
