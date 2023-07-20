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

    public static func openGraphMetaTags(info: OpenGraphInfo) -> Node<HTML.HeadContext> {
        .group(
            .openGraphMetaTag(named: "og:title", value: info.title),
            .openGraphMetaTag(named: "og:description", value: info.description),
            .openGraphMetaTag(named: "og:site_name", value: info.siteName),
            .openGraphMetaTag(named: "og:url", value: info.url),
            info.type.metaTags,
            info.image.metaTags,
            .unwrap(info.audio) { audio in
                audio.metaTags
            },
            .unwrap(info.video) { video in
                video.metaTags
            },
            .unwrap(info.locale) { locale in
                locale.metaTags
            },
            .openGraphMetaTag(named: "og:determiner", value: info.determiner?.rawValue)
        )
    }
}

