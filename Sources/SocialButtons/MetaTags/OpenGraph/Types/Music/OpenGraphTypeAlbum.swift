//
//  OpenGraphTypeAlbum.swift
//  
//
//  Created by Alan Paiva on 7/17/23.
//

import Foundation
import Plot

/// Additional tags for the `music.album` type, see ``OpenGraphType``
public struct OpenGraphTypeAlbum: MetaTaggableContent {
    private let songUrls: [String]
    private let disc: Int?
    private let track: Int?
    private let musiciansUrls: [String]
    private let releaseDate: Date?

    /// Initializer
    ///
    /// - Parameters:
    ///   - songUrls: **music:song**, the songs on this album
    ///   - disc: **music:song:disc**, the same as **music:album:disc** but in reverse
    ///   - track: **music:song:track**, the same as **music:album:track** but in reverse
    ///   - musicianUrls: **music:musician**, urls to the musician that made this song
    ///   - releaseDate: **music:release_date**, the date the album was released
    public init(songUrls: [String] = [],
                disc: Int? = nil,
                track: Int? = nil,
                musiciansUrls: [String] = [],
                releaseDate: Date? = nil) {
        self.songUrls = songUrls
        self.disc = disc
        self.track = track
        self.musiciansUrls = musiciansUrls
        self.releaseDate = releaseDate
    }

    public var metaTags: Node<HTML.HeadContext> {
        let albumTags: [Node<HTML.HeadContext>] = [
            .openGraphMetaTag(property: "og:type", content: "music.album"),
            .openGraphMetaTag(property: "music:song:disc", content: disc),
            .openGraphMetaTag(property: "music:song:track", content: track),
            .openGraphMetaTag(property: "music:release_date", content: releaseDate?.iso8601DateFormatted())
        ]
        let musicianTags: [Node<HTML.HeadContext>] = musiciansUrls.map { profileUrl in
            .openGraphMetaTag(property: "music:musician", content: profileUrl)
        }
        let songTags: [Node<HTML.HeadContext>] = songUrls.map { songUrl in
            .openGraphMetaTag(property: "music:song", content: songUrl)
        }
        return .group(albumTags + musicianTags + songTags)
    }
}
