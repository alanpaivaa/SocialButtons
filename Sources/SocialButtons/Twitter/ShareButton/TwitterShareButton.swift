//
//  Created by Alan Paiva on 1/9/22.
//

import Foundation
import Plot
import Publish

/// Component that renders a Twitter share button.
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

    /// Initializer.
    ///
    /// - Parameters:
    ///   - urlGenerator: The generator that makes the URL to open Twitters with the shared content.
    ///   - style: The style (size) to render the Tweet button.
    ///   - text: A text to be Tweeted.
    ///   - url: URL to be shared on the Tweet.
    ///   - hashTags: A list of hash tags to be used in the Tweet.
    ///   - via: Twitter account for attribution.
    ///   - related: Related Twitter accounts to the shared content.
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
