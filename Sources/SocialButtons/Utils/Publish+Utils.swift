//
//  File.swift
//  
//
//  Created by Alan Paiva on 1/9/22.
//

import Foundation
import Publish

public extension Item {
    func url<T>(for context: PublishingContext<T>) -> URL {
        context.site.url.appendingPathComponent(path.string)
    }
}
