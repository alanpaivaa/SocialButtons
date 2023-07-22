//
//  OpenGraphContent.swift
//  
//
//  Created by Alan Paiva on 7/16/23.
//

import Foundation
import Plot

public protocol OpenGraphContent {
    var metaTags: Node<HTML.HeadContext> { get }
}
