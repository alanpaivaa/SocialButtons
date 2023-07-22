//
//  File.swift
//  
//
//  Created by Alan Paiva on 7/19/23.
//

import Foundation
import Plot

extension Node<HTML.HeadContext> {
    static func openGraphMetaTag<S: CustomStringConvertible>(named: String, value: S?) -> Node {
        .unwrap(value, { .meta(.property(named), .content("\($0)")) })
    }

    public static func openGraphContent(_ content: OpenGraphContent?) -> Node {
        .unwrap(content) { $0.metaTags }
    }
}

