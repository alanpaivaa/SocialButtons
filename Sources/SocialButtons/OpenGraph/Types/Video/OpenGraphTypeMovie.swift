//
//  OpenGraphTypeMovie.swift
//  
//
//  Created by Alan Paiva on 7/17/23.
//

import Foundation
import Plot

open class OpenGraphTypeMovie {
    private let actorsUrls: [String]
    private let directorsUrls: [String]
    private let writersUrls: [String]
    private let duration: Int?
    private let releaseDate: Date?
    private let tags: [String]

    var type: String {
        "video.movie"
    }

    public init(actorsUrls: [String] = [],
                directorsUrls: [String] = [],
                writersUrls: [String] = [],
                duration: Int? = nil,
                releaseDate: Date?,
                tags: [String] = []) {
        self.actorsUrls = actorsUrls
        self.directorsUrls = directorsUrls
        self.writersUrls = writersUrls
        self.duration = duration
        self.releaseDate = releaseDate
        self.tags = tags
    }

    var metaTags: Node<HTML.HeadContext> {
        let actorsTags: [Node<HTML.HeadContext>] = actorsUrls.map { actorUrl in
            .openGraphMetaTag(named: "video:actor", value: actorUrl)
        }
        let directorsTags: [Node<HTML.HeadContext>] = directorsUrls.map { directorUrl in
            .openGraphMetaTag(named: "video:director", value: directorUrl)
        }
        let writersTags: [Node<HTML.HeadContext>] = writersUrls.map { writerUrl in
            .openGraphMetaTag(named: "video:writer", value: writerUrl)
        }
        let tags: [Node<HTML.HeadContext>] = tags.map { tag in
            .openGraphMetaTag(named: "video:tag", value: tag)
        }
        let tagsNodes: [Node<HTML.HeadContext>] = [
            .openGraphMetaTag(named: "og:type", value: type),
            .openGraphMetaTag(named: "video:duration", value: duration),
            .openGraphMetaTag(named: "video:release_date", value: releaseDate?.iso8601Formatted())
        ]
        return .group(tagsNodes + actorsTags + directorsTags + writersTags + tags)
    }
}
