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

    private var shareURL: URL? {
        urlGenerator.make(text: text, url: url)
    }

    public init(
        text: String,
        url: URL? = nil,
        style: TwitterShareButtonStyle? = nil
    ) {
        self.init(
            urlGenerator: TwitterURLGenerator(),
            text: text,
            url: url,
            style: style
        )
    }

    init(
        urlGenerator: TwitterURLGenerating,
        text: String,
        url: URL?,
        style: TwitterShareButtonStyle?
    ) {
        self.urlGenerator = urlGenerator
        self.text = text
        self.url = url
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
