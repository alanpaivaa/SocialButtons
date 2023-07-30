//
//  File.swift
//  
//
//  Created by Alan Paiva on 7/19/23.
//

import Foundation
import Plot

extension Node<HTML.HeadContext> {
    static func metaTag<S: CustomStringConvertible>(property: String, content: S?) -> Node {
        .unwrap(content, { .meta(.property(property), .content("\($0)")) })
    }

    static func metaTag<S: CustomStringConvertible>(name: String, content: S?) -> Node {
        .unwrap(content, { .meta(.name(name), .content("\($0)")) })
    }

    static func metaTag<S: CustomStringConvertible>(itemprop: String, content: S?) -> Node {
        .unwrap(content, { .meta(.attribute(named: "itemprop", value: itemprop), .content("\($0)")) })
    }

    static func openGraphMetaTag<S: CustomStringConvertible>(property: String, content: S?) -> Node {
        .metaTag(property: property, content: content)
    }

    public static func metaContent(_ content: MetaTaggableContent? ...) -> Node {
        .group(content.compactMap { $0?.metaTags })
    }

    public static func metaContent(_ content: [MetaTaggableContent]) -> Node {
        .group(content.map { $0.metaTags })
    }

    static func twitterMetaTag<S: CustomStringConvertible>(name: String, value: S?) -> Node {
        .unwrap(value, { .meta(.name(name), .content("\($0)")) })
    }
}

