//
//  OpenGraphTypeTVShow.swift
//  
//
//  Created by Alan Paiva on 7/19/23.
//

import Foundation
import Plot

/// Additional tags for the `video.tv_show` type, see ``OpenGraphType``
public final class OpenGraphTypeTVShow: OpenGraphTypeMovie {
    override var type: String {
        "video.tv_show"
    }
}
