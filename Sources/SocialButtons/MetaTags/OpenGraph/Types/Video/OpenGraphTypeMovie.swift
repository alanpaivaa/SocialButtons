//
//  OpenGraphTypeMovie.swift
//  
//
//  Created by Alan Paiva on 7/17/23.
//

import Foundation
import Plot

/// Additional tags for the `video.movie` type, see ``OpenGraphType``
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

    /// Initializer
    ///
    /// - Parameters:
    ///   - actorsUrls: **video:actor**, actors in the movie
    ///   - directorsUrls: **video:director**, directors of the movie
    ///   - writersUrls: **video:writer**, writers of the movie
    ///   - duration: **video:duration**, the movie's length in seconds
    ///   - releaseDate: **video:release_date**, the date the movie was released
    ///   - tags: **video:tag**, tag words associated with this movie
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
            .openGraphMetaTag(property: "video:actor", content: actorUrl)
        }
        let directorsTags: [Node<HTML.HeadContext>] = directorsUrls.map { directorUrl in
            .openGraphMetaTag(property: "video:director", content: directorUrl)
        }
        let writersTags: [Node<HTML.HeadContext>] = writersUrls.map { writerUrl in
            .openGraphMetaTag(property: "video:writer", content: writerUrl)
        }
        let tags: [Node<HTML.HeadContext>] = tags.map { tag in
            .openGraphMetaTag(property: "video:tag", content: tag)
        }
        let tagsNodes: [Node<HTML.HeadContext>] = [
            .openGraphMetaTag(property: "og:type", content: type),
            .openGraphMetaTag(property: "video:duration", content: duration),
            .openGraphMetaTag(property: "video:release_date", content: releaseDate?.iso8601DateFormatted())
        ]
        return .group(tagsNodes + actorsTags + directorsTags + writersTags + tags)
    }
}
