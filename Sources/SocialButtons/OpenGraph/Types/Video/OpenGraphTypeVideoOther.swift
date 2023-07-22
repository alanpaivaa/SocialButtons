//
//  OpenGraphTypeVideoOther.swift
//  
//
//  Created by Alan Paiva on 7/19/23.
//

import Foundation

/// Additional tags for the `video.other` type, see ``OpenGraphType``
public final class OpenGraphTypeVideoOther: OpenGraphTypeMovie {
    override var type: String {
        "video.other"
    }
}
