//
//  Created by Alan Paiva on 1/9/22.
//

import Foundation

protocol TwitterURLGenerating {
    func make(text: String) -> URL?
}

struct TwitterURLGenerator: TwitterURLGenerating {
    private enum Constants {
        static let baseURL = "https://twitter.com/intent/tweet"

        enum QueryParameters {
            static let text = "text"
        }
    }

    func make(text: String) -> URL? {
        var queryItems = [URLQueryItem]()

        queryItems.append(.init(name: Constants.QueryParameters.text, value: text))

        var components = URLComponents(string: Constants.baseURL)
        components?.queryItems = queryItems

        return components?.url
    }
}
