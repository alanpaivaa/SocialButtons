//
//  Created by Alan Paiva on 1/9/22.
//

import Foundation
import Plot
import Publish

public struct TwitterShareButton: Component {
    private let urlGenerator: TwitterShareURLGenerating
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
        urlGenerator: TwitterShareURLGenerating = TwitterShareURLGenerator(),
        style: TwitterShareButtonStyle? = nil,
        text: String,
        url: URL? = nil,
        hashTags: [String] = [],
        via: String? = nil,
        related: [String] = []
    ) {
        self.urlGenerator = urlGenerator
        self.style = style
        self.text = text
        self.url = url
        self.hashTags = hashTags
        self.via = via
        self.related = related
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