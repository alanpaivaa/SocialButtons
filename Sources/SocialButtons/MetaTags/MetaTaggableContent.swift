//
//  MetaTaggableContent.swift
//  
//
//  Created by Alan Paiva on 7/16/23.
//

import Foundation
import Plot

/// Conformers are able to render OpenGraph meta tags in a web page
public protocol MetaTaggableContent {
    /// Meta tags to be rendered
    var metaTags: Node<HTML.HeadContext> { get }
}
