//
//  OpenGraphDeterminer.swift
//  
//
//  Created by Alan Paiva on 7/16/23.
//

import Foundation
import Plot

public enum OpenGraphDeterminer: String, OpenGraphContent {
    case a
    case an
    case the
    case auto
    case blank = ""

    public var metaTags: Node<HTML.HeadContext> {
        .openGraphMetaTag(named: "og:determiner", value: rawValue)
    }
}
