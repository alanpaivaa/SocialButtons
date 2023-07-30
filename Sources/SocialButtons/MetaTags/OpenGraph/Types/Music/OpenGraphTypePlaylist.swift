//
//  OpenGraphTypePlaylist.swift
//  
//
//  Created by Alan Paiva on 7/17/23.
//

import Foundation
import Plot

/// Additional tags for the `music.playlist` type, see ``OpenGraphType``
public struct OpenGraphTypePlaylist: MetaTaggableContent {
    private let songUrls: [String]
    private let disc: Int?
    private let track: Int?
    private let creatorsUrls: [String]

    /// Initializer
    ///
    /// - Parameters:
    ///   - songUrls: **music:song**, identical to the ones on ``OpenGraphTypeAlbum``
    ///   - disc: **music:song:disc**, the same as **music:album:disc** but in reverse
    ///   - track: **music:song:track**, the same as **music:album:track** but in reverse
    ///   - creatorsUrls: **music:creator**, the URLs for the creators of this playlist
    public init(songUrls: [String] = [],
                disc: Int? = nil,
                track: Int? = nil,
                creatorsUrls: [String] = []) {
        self.songUrls = songUrls
        self.disc = disc
        self.track = track
        self.creatorsUrls = creatorsUrls
    }

    public var metaTags: Node<HTML.HeadContext> {
        let tags: [Node<HTML.HeadContext>] = [
            .openGraphMetaTag(name: "og:type", content: "music.playlist"),
            .openGraphMetaTag(name: "music:song:disc", content: disc),
            .openGraphMetaTag(name: "music:song:track", content: track)
        ]
        let songTags: [Node<HTML.HeadContext>] = songUrls.map { songUrl in
            .openGraphMetaTag(name: "music:song", content: songUrl)
        }
        let creatorsTags: [Node<HTML.HeadContext>] = creatorsUrls.map { creatorUrl in
            .openGraphMetaTag(name: "music:creator", content: creatorUrl)
        }
        return .group(tags + songTags + creatorsTags)
    }
}
