//
//  OpenGraphLocale.swift
//  
//
//  Created by Alan Paiva on 7/16/23.
//

import Foundation
import Plot

public struct OpenGraphLocale: OpenGraphContent {
    private let identifier: String
    private let alternateIdentifiers: [String]
    
    public init(identifier: String,
                alternateIdentifiers: [String] = []) {
        self.identifier = identifier
        self.alternateIdentifiers = alternateIdentifiers
    }

    var metaTags: Node<HTML.HeadContext> {
        let mainMember = Node<HTML.HeadContext>.openGraphMetaTag(named: "og:locale", value: identifier)
        let alternateMembers = alternateIdentifiers.map { identifier -> Node<HTML.HeadContext> in
                .openGraphMetaTag(named: "og:locale:alternate", value: identifier)
        }
        return .group([mainMember] + alternateMembers)
    }
}
