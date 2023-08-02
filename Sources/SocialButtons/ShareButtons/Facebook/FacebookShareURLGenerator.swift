//
//  File.swift
//  
//
//  Created by Alan Paiva on 8/1/23.
//

import Foundation

protocol FacebookShareURLGenerating {
    func make(url: URL) -> URL?
}

struct FacebookShareURLGenerator: FacebookShareURLGenerating {
    private enum Constants {
        static let baseURL = "https://www.facebook.com/sharer/sharer.php"
    }

    public init() {}

    public func make(url: URL) -> URL? {
        let queryItem = URLQueryItem(name: "u", value: url.absoluteString)
        var components = URLComponents(string: Constants.baseURL)
        components?.queryItems = [queryItem]
        return components?.url
    }
}
