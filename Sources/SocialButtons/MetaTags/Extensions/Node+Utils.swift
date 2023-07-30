//
//  File.swift
//  
//
//  Created by Alan Paiva on 7/19/23.
//

import Foundation
import Plot

extension Node<HTML.HeadContext> {
    static func metaTag<S: CustomStringConvertible>(name: String, content: S?) -> Node {
        .unwrap(content, { .meta(.property(name), .content("\($0)")) })
    }

    static func openGraphMetaTag<S: CustomStringConvertible>(name: String, content: S?) -> Node {
        .metaTag(name: name, content: content)
    }

    public static func metaContent(_ content: MetaTaggableContent? ...) -> Node {
        .group(content.compactMap { $0?.metaTags })
    }

    public static func metaContent(_ content: [MetaTaggableContent]) -> Node {
        .group(content.map { $0.metaTags })
    }

    static func twitterMetaTag<S: CustomStringConvertible>(named: String, value: S?) -> Node {
        .unwrap(value, { .meta(.name(named), .content("\($0)")) })
    }
}

