//
//  OpenGraphTypeEpisode.swift
//  
//
//  Created by Alan Paiva on 7/19/23.
//

import Foundation
import Plot

public final class OpenGraphTypeEpisode: OpenGraphTypeMovie {
    private let seriesUrl: String?

    override var type: String {
        "video.episode"
    }

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
            .openGraphMetaTag(named: "video:series", value: seriesUrl)
        )
    }
}
