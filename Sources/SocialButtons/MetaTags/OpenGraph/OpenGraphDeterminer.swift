//
//  OpenGraphDeterminer.swift
//  
//
//  Created by Alan Paiva on 7/16/23.
//

import Foundation
import Plot

/// The word that appears before this object's title in a sentence
public enum OpenGraphDeterminer: String, MetaTaggableContent {
    case a
    case an
    case the
    case auto
    case blank = ""

    public var metaTags: Node<HTML.HeadContext> {
        .openGraphMetaTag(property: "og:determiner", content: rawValue)
    }
}
