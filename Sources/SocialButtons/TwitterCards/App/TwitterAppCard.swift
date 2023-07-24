//
//  TwitterAppCard.swift
//  
//
//  Created by Alan Paiva on 7/23/23.
//

import Foundation
import Plot

public struct TwitterAppCard: OpenGraphContent {
    private let site: TwitterSite
    private let iOSApps: TwitterIOSApps
    private let androidApp: TwitterAndroidApp
    private let description: String?

    public init(site: TwitterSite,
                iOSApps: TwitterIOSApps,
                androidApp: TwitterAndroidApp,
                description: String? = nil) {
        self.site = site
        self.iOSApps = iOSApps
        self.androidApp = androidApp
        self.description = description
    }

    public var metaTags: Node<HTML.HeadContext> {
        .group(
            .twitterMetaTag(named: "twitter:card", value: "app"),
            .twitterMetaTag(named: "twitter:description", value: description),
            .openGraphContent(site),
            .openGraphContent(iOSApps),
            .openGraphContent(androidApp)
        )
    }
}
