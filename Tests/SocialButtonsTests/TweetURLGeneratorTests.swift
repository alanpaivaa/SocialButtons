//
//  Created by Alan Paiva on 1/10/22.
//

import XCTest
@testable import SocialButtons

final class TweetURLGeneratorTests: XCTestCase {
    private let generator = TweetURLGenerator()

    func test_make_whenUsingEmptyParameterValues_doesNotAddEmptyQueryParameters() {
        let url = generator.make(text: "hello", url: nil, hashTags: [], via: nil, related: [])
        XCTAssertEqual(url?.absoluteString, "https://twitter.com/intent/tweet?text=hello")
    }

    func test_make_whenAddingParameters_addsAllQueryParameters() {
        let url = generator.make(
            text: "hello",
            url: URL(string: "https://some.blog.com"),
            hashTags: ["tag_a", "tag_b"],
            via: "blogger_a",
            related: ["blogger_b", "blogger_c"]
        )
        XCTAssertEqual(
            url?.absoluteString,
            "https://twitter.com/intent/tweet?text=hello&url=https://some.blog.com&hashtags=tag_a,tag_b&via=blogger_a&related=blogger_b,blogger_c"
        )
    }

    func test_make_whenUsingCerquilhaSymbol_stripsHashTags() {
        let url = generator.make(
            text: "hello",
            url: nil,
            hashTags: ["#tag_a", "##tag_b"],
            via: nil,
            related: []
        )
        XCTAssertEqual(url?.absoluteString, "https://twitter.com/intent/tweet?text=hello&hashtags=tag_a,tag_b")
    }

    func test_make_whenUsingAtSymbol_stripsAccountNames() {
        let url = generator.make(
            text: "hello",
            url: nil,
            hashTags: [],
            via: "@blogger_a",
            related: ["@blogger_b", "@blogger_c"]
        )
        XCTAssertEqual(url?.absoluteString, "https://twitter.com/intent/tweet?text=hello&via=blogger_a&related=blogger_b,blogger_c")
    }
}
