//
//  OpenGraphTypeProfile.swift
//  
//
//  Created by Alan Paiva on 7/17/23.
//

import Foundation
import Plot

public struct OpenGraphTypeProfile: OpenGraphContent {
    private let firstName: String?
    private let lastName: String?
    private let username: String?
    private let gender: OpenGraphGender?

    public init(firstName: String? = nil,
                lastName: String? = nil,
                username: String? = nil,
                gender: OpenGraphGender? = nil) {
        self.firstName = firstName
        self.lastName = lastName
        self.username = username
        self.gender = gender
    }

    var metaTags: Node<HTML.HeadContext> {
        .group(
            .openGraphMetaTag(named: "og:type", value: "profile"),
            .openGraphMetaTag(named: "profile:first_name", value: firstName),
            .openGraphMetaTag(named: "profile:last_name", value: lastName),
            .openGraphMetaTag(named: "profile:username", value: username),
            .openGraphMetaTag(named: "profile:gender", value: gender?.rawValue)
        )
    }
}
