//
//  Created by Alan Paiva on 1/9/22.
//

import Foundation
import Plot
import Publish

public struct TwitterShareButton: Component {
    private let urlGenerator: TwitterURLGenerating
    private let text: String

    private var shareURL: URL? {
        urlGenerator.make(text: text)
    }

    public init(text: String) {
        self.init(urlGenerator: TwitterURLGenerator(), text: text)
    }

    init(urlGenerator: TwitterURLGenerating, text: String) {
        self.urlGenerator = urlGenerator
        self.text = text
    }

    public var body: Component {
        Node.span(
            .unwrap(shareURL, { url in
                .a(
                    .text("Share on Twitter"),
                    .href(url)
                )
            })
        )
    }
}
