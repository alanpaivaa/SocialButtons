//
//  Created by Alan Paiva on 1/9/22.
//

import Foundation
import Plot
import Publish

public struct TwitterShareButton: Component {
    private let urlGenerator: TwitterURLGenerating
    private let style: TwitterShareButtonStyle?
    private let text: String
    private let url: URL?
    private let hashTags: [String]
    private let via: String?
    private let related: [String]

    private var shareURL: URL? {
        urlGenerator.make(text: text, url: url, hashTags: hashTags, via: via, related: related)
    }

    public init(
        text: String,
        url: URL? = nil,
        hashTags: [String] = [],
        via: String? = nil,
        related: [String] = [],
        style: TwitterShareButtonStyle? = nil
    ) {
        self.init(
            urlGenerator: TwitterURLGenerator(),
            text: text,
            url: url,
            hashTags: hashTags,
            via: via,
            related: related,
            style: style
        )
    }

    init(
        urlGenerator: TwitterURLGenerating,
        text: String,
        url: URL?,
        hashTags: [String] = [],
        via: String?,
        related: [String] = [],
        style: TwitterShareButtonStyle?
    ) {
        self.urlGenerator = urlGenerator
        self.text = text
        self.url = url
        self.hashTags = hashTags
        self.via = via
        self.related = related
        self.style = style
    }

    public var body: Component {
        Node.span(
            .unwrap(shareURL, { url in
                .a(
                    .text("Tweet"),
                    .href(url),
                    .class(style != nil ? "twitter-share-button" : "no-widget"),
                    .attribute(
                        named: "data-size",
                        value: style?.rawValue,
                        ignoreIfValueIsEmpty: true
                    )
                )
            })
        )
    }
}
