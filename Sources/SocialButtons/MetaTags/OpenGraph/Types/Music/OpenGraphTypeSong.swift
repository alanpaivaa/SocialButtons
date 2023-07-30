//
//  OpenGraphTypeSong.swift
//  
//
//  Created by Alan Paiva on 7/17/23.
//

import Foundation
import Plot

/// Additional tags for the `music.song` type, see ``OpenGraphType``
public struct OpenGraphTypeSong: MetaTaggableContent {
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
            .openGraphMetaTag(property: "og:type", content: "music.song"),
            .openGraphMetaTag(property: "music:duration", content: duration),
            .openGraphMetaTag(property: "music:album:disc", content: disc),
            .openGraphMetaTag(property: "music:album:track", content: track)
        ]
        let albumTags: [Node<HTML.HeadContext>] = albumUrls.map { albumUrl in
            .openGraphMetaTag(property: "music:album", content: albumUrl)
        }
        let musicianTags: [Node<HTML.HeadContext>] = musicianUrls.map { musicianUrl in
            .openGraphMetaTag(property: "music:musician", content: musicianUrl)
        }
        return .group(tags + albumTags + musicianTags)
    }
}
