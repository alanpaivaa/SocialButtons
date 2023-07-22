//
//  OpenGraphTypeProfile.swift
//  
//
//  Created by Alan Paiva on 7/17/23.
//

import Foundation
import Plot

/// Additional tags for the `profile` type, see ``OpenGraphType``
public struct OpenGraphTypeProfile: OpenGraphContent {
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
            .openGraphMetaTag(named: "og:type", value: "profile"),
            .openGraphMetaTag(named: "profile:first_name", value: firstName),
            .openGraphMetaTag(named: "profile:last_name", value: lastName),
            .openGraphMetaTag(named: "profile:username", value: username),
            .openGraphMetaTag(named: "profile:gender", value: gender?.rawValue)
        )
    }
}
