//
//  ShareURLGenerator.swift
//  
//
//  Created by Alan Paiva on 7/11/23.
//

import Foundation

public enum SocialMedia: String {
    case facebook
    case linkedIn
    case twitter
}

/// Conformers are able to generate URLs for sharing multiple Social media.
public protocol ShareURLGenerating {
    /// Makes a social media share URL.
    ///
    /// - Parameters:
    ///   - text: The text to be shared.
    ///   - url: URL to the content to be shared.
    ///   - hashTags: Hash tags to be used.
    ///   - via: Account for attribution.
    ///   - related: Accounts related to the shared content.
    func make(socialMedia: SocialMedia, text: String, url: URL?, hashTags: [String], via: String?, related: [String]) -> URL?
}

public class ShareURLGenerator: ShareURLGenerating {
    public init() {}

    public func make(socialMedia: SocialMedia, text: String, url: URL?, hashTags: [String], via: String?, related: [String]) -> URL? {
        guard let url else {
            return nil
        }

        switch socialMedia {
        case .facebook:
            let generator = FacebookShareURLGenerator()
            return generator.make(url: url)
        case .linkedIn:
            let generator = LinkedInShareURLGenerator()
            return generator.make(url: url)
        case .twitter:
            let generator = TweetURLGenerator()
            return generator.make(text: text, url: url, hashTags: hashTags, via: via, related: related)
        }
    }
}
