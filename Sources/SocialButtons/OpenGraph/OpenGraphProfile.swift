//
//  OpenGraphProfile.swift
//  
//
//  Created by Alan Paiva on 7/17/23.
//

import Foundation
import Plot

struct OpenGraphProfile: OpenGraphContent {
    private let firstName: String?
    private let lastName: String?
    private let userName: String?
    private let gender: OpenGraphGender?

    public init(firstName: String? = nil,
                lastName: String? = nil,
                userName: String? = nil,
                gender: OpenGraphGender? = nil) {
        self.firstName = firstName
        self.lastName = lastName
        self.userName = userName
        self.gender = gender
    }

    var metaTags: Node<HTML.HeadContext> {
        .group(
            .openGraphMetaTag(named: "profile:first_name", value: firstName),
            .openGraphMetaTag(named: "profile:last_name", value: lastName),
            .openGraphMetaTag(named: "profile:username", value: userName),
            .openGraphMetaTag(named: "profile:gender", value: gender?.rawValue)
        )
    }
}
