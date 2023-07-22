//
//  LinkedInShareURLGenerator.swift
//  
//
//  Created by Alan Paiva on 7/11/23.
//

import Foundation

/// Conformer should be able to make share LinkedIn URLs
public protocol LinkedInShareURLGenerating {
    /// Makes a share URL
    ///
    /// - Parameter url: the URL to be shared.
    func make(url: URL) -> URL?
}

public final class LinkedInShareURLGenerator: LinkedInShareURLGenerating {
    private enum Constants {
        static let baseURL = "https://www.linkedin.com/sharing/share-offsite"
    }

    public init() {}

    public func make(url: URL) -> URL? {
        let queryItem = URLQueryItem(name: "url", value: url.absoluteString)
        var components = URLComponents(string: Constants.baseURL)
        components?.queryItems = [queryItem]
        return components?.url
    }
}
