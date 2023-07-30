//
//  OpenGraphTypeProfile.swift
//  
//
//  Created by Alan Paiva on 7/17/23.
//

import Foundation
import Plot

/// Additional tags for the `profile` type, see ``OpenGraphType``
public struct OpenGraphTypeProfile: MetaTaggableContent {
    private let firstName: String?
    private let lastName: String?
    private let username: String?
    private let gender: OpenGraphGender?

    /// Initializer
    ///
    /// - Parameters:
    ///   - firstName: **profile:first_name**, a name normally given to an individual by a parent or self-chosen
    ///   - lastName: **profile:last_name**, a name inherited from a family or marriage and by which the individual is commonly known
    ///   - username: **profile:username**, a short unique string to identify them
    ///   - gender: **profile:gender**, their gender
    public init(firstName: String? = nil,
                lastName: String? = nil,
                username: String? = nil,
                gender: OpenGraphGender? = nil) {
        self.firstName = firstName
        self.lastName = lastName
        self.username = username
        self.gender = gender
    }

    public var metaTags: Node<HTML.HeadContext> {
        .group(
            .openGraphMetaTag(property: "og:type", content: "profile"),
            .openGraphMetaTag(property: "profile:first_name", content: firstName),
            .openGraphMetaTag(property: "profile:last_name", content: lastName),
            .openGraphMetaTag(property: "profile:username", content: username),
            .openGraphMetaTag(property: "profile:gender", content: gender?.rawValue)
        )
    }
}
