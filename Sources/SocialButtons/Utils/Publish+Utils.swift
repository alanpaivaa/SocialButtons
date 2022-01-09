//
//  File.swift
//  
//
//  Created by Alan Paiva on 1/9/22.
//

import Foundation
import Publish

public extension Item {
    /// Constructs an absolute URL for this Item, using the given context.
    ///
    /// - Parameter context: The site URL in this context will be used to make an absolute URL to this Item.
    func url<T>(for context: PublishingContext<T>) -> URL {
        context.site.url.appendingPathComponent(path.string)
    }
}
