//
//  Created by Alan Paiva on 1/9/22.
//

import Foundation

/// Conformers are able to generate URLs for sharing content on Twitter.
public protocol TweetURLGenerating {
    /// Makes an intent URL to share content on Twitter.
    ///
    /// - Parameters:
    ///   - text: The text in the tweet.
    ///   - url: URL to the content to be shared.
    ///   - hashTags: Hash tags to be placed in the tweet.
    ///   - via: Twitter account for attribution.
    ///   - related: Twitter accounts related to the shared content.
    func make(text: String, url: URL?, hashTags: [String], via: String?, related: [String]) -> URL?
}

public struct TweetURLGenerator: TweetURLGenerating {
    private enum Constants {
        static let baseURL = "https://twitter.com/intent/tweet"

        enum QueryParameters {
            static let text = "text"
            static let url = "url"
            static let hashtags = "hashtags"
            static let via = "via"
            static let related = "related"
        }
    }

    public init() {}

    public func make(text: String, url: URL?, hashTags: [String], via: String?, related: [String]) -> URL? {
        var queryItems = [URLQueryItem]()

        queryItems.append(.init(name: Constants.QueryParameters.text, value: text))

        if let url = url {
            queryItems.append(.init(name: Constants.QueryParameters.url, value: url.absoluteString))
        }

        if !hashTags.isEmpty {
            let commaSeparatedHashTags = hashTags
                .map { $0.trimmingCharacters(in: ["#"]) }
                .joined(separator: ",")
            queryItems.append(.init(name: Constants.QueryParameters.hashtags, value: commaSeparatedHashTags))
        }

        if let via = via {
            queryItems.append(.init(name: Constants.QueryParameters.via, value: via.trimmingCharacters(in: ["@"])))
        }

        if !related.isEmpty {
            let commaSeparatedRelated = related
                .map { $0.trimmingCharacters(in: ["@"]) }
                .joined(separator: ",")
            queryItems.append(.init(name: Constants.QueryParameters.related, value: commaSeparatedRelated))
        }

        var components = URLComponents(string: Constants.baseURL)
        components?.queryItems = queryItems

        return components?.url
    }
}
