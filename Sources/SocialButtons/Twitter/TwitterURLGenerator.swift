//
//  Created by Alan Paiva on 1/9/22.
//

import Foundation

protocol TwitterURLGenerating {
    func make(text: String, url: URL?) -> URL?
}

struct TwitterURLGenerator: TwitterURLGenerating {
    private enum Constants {
        static let baseURL = "https://twitter.com/intent/tweet"

        enum QueryParameters {
            static let text = "text"
            static let url = "url"
        }
    }

    func make(text: String, url: URL?) -> URL? {
        var queryItems = [URLQueryItem]()

        queryItems.append(.init(name: Constants.QueryParameters.text, value: text))
        if let url = url {
            queryItems.append(.init(name: Constants.QueryParameters.url, value: url.absoluteString))
        }

        var components = URLComponents(string: Constants.baseURL)
        components?.queryItems = queryItems

        return components?.url
    }
}
