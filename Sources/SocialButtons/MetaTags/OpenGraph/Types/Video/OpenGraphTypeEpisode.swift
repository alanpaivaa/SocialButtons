//
//  OpenGraphTypeEpisode.swift
//  
//
//  Created by Alan Paiva on 7/19/23.
//

import Foundation
import Plot

/// Additional tags for the `video.episode` type, see ``OpenGraphType``
public final class OpenGraphTypeEpisode: OpenGraphTypeMovie {
    private let seriesUrl: String?

    override var type: String {
        "video.episode"
    }

    /// Initializer
    ///
    /// - Parameters:
    ///   - actorsUrls: **video:actor**, actors in the episode
    ///   - directorsUrls: **video:director**, directors of the episode
    ///   - writersUrls: **video:writer**, writers of the episode
    ///   - duration: **video:duration**, the movie's length in episode
    ///   - releaseDate: **video:release_date**, the date the episode was released
    ///   - tags: **video:tag**, tag words associated with this episode
    ///   - seriesUrl: **video:series**, which series this episode belongs to
    public init(actorsUrls: [String] = [],
                directorsUrls: [String] = [],
                writersUrls: [String] = [],
                duration: Int? = nil,
                releaseDate: Date?,
                tags: [String] = [],
                seriesUrl: String?) {
        self.seriesUrl = seriesUrl

        super.init(actorsUrls: actorsUrls,
                   directorsUrls: directorsUrls,
                   writersUrls: writersUrls,
                   duration: duration,
                   releaseDate: releaseDate,
                   tags: tags
        )
    }

    override var metaTags: Node<HTML.HeadContext> {
        let inheritedTags = super.metaTags
        return .group(
            inheritedTags,
            .openGraphMetaTag(name: "video:series", content: seriesUrl)
        )
    }
}
