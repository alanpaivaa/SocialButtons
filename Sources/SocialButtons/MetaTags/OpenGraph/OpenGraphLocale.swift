//
//  OpenGraphLocale.swift
//  
//
//  Created by Alan Paiva on 7/16/23.
//

import Foundation
import Plot

/// The locale the object tags are marked up in
public struct OpenGraphLocale: MetaTaggableContent {
    private let identifier: String
    private let alternateIdentifiers: [String]

    /// Initializer
    /// 
    /// - Parameters:
    ///   - identifier: **og:locale**, main locale in the format `language_TERRITORY`
    ///   - alternateIdentifiers: **og:locale:alternate**, an array of other available locales
    public init(identifier: String,
                alternateIdentifiers: [String] = []) {
        self.identifier = identifier
        self.alternateIdentifiers = alternateIdentifiers
    }

    public var metaTags: Node<HTML.HeadContext> {
        let mainMember = Node<HTML.HeadContext>.openGraphMetaTag(named: "og:locale", value: identifier)
        let alternateMembers = alternateIdentifiers.map { identifier -> Node<HTML.HeadContext> in
                .openGraphMetaTag(named: "og:locale:alternate", value: identifier)
        }
        return .group([mainMember] + alternateMembers)
    }
}
