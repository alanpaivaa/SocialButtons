//
//  OpenGraphTypeAlbum.swift
//  
//
//  Created by Alan Paiva on 7/17/23.
//

import Foundation
import Plot

public struct OpenGraphTypeAlbum: OpenGraphContent {
    private let songUrls: [String]
    private let disc: Int?
    private let track: Int?
    private let musiciansUrls: [String]
    private let releaseDate: Date?
    
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

    var metaTags: Node<HTML.HeadContext> {
        let albumTags: [Node<HTML.HeadContext>] = [
            .openGraphMetaTag(named: "og:type", value: "music.album"),
            .openGraphMetaTag(named: "music:song:disc", value: disc),
            .openGraphMetaTag(named: "music:song:track", value: track),
            .openGraphMetaTag(named: "music:release_date", value: releaseDate?.iso8601Formatted())
        ]
        let musicianTags: [Node<HTML.HeadContext>] = musiciansUrls.map { profileUrl in
            .openGraphMetaTag(named: "music:musician", value: profileUrl)
        }
        let songTags: [Node<HTML.HeadContext>] = songUrls.map { songUrl in
            .openGraphMetaTag(named: "music:song", value: songUrl)
        }
        return .group(albumTags + musicianTags + songTags)
    }
}
