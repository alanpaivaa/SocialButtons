//
//  TwitterApp.swift
//  
//
//  Created by Alan Paiva on 7/23/23.
//

import Foundation
import Plot

fileprivate enum TwitterAppPlatform: String {
    case android = "googleplay"
    case ipad
    case iphone
}

public class TwitterApp: MetaTaggableContent {
    private let id: String
    private let url: String?
    private let name: String?
    private let platform: TwitterAppPlatform

    fileprivate init(id: String,
                     url: String?,
                     name: String?,
                     platform: TwitterAppPlatform) {
        self.id = id
        self.url = url
        self.name = name
        self.platform = platform
    }

    public var metaTags: Node<HTML.HeadContext> {
        .group(
            .twitterMetaTag(name: "twitter:app:id:\(platform.rawValue)", value: id),
            .twitterMetaTag(name: "twitter:app:url:\(platform.rawValue)", value: url),
            .twitterMetaTag(name: "twitter:app:name:\(platform.rawValue)", value: name)
        )
    }
}

public final class TwitterIphoneApp: TwitterApp {
    public init(id: String, url: String? = nil, name: String? = nil) {
        super.init(id: id, url: url, name: name, platform: .iphone)
    }
}

public final class TwitterIpadApp: TwitterApp {
    public init(id: String, url: String? = nil, name: String? = nil) {
        super.init(id: id, url: url, name: name, platform: .ipad)
    }
}

public final class TwitterAndroidApp: TwitterApp {
    public init(id: String, url: String? = nil, name: String? = nil) {
        super.init(id: id, url: url, name: name, platform: .android)
    }
}

public struct TwitterIOSApps: MetaTaggableContent {
    private let iphone: TwitterIphoneApp
    private let ipad: TwitterIpadApp
    private let country: String?

    public init(iphone: TwitterIphoneApp, ipad: TwitterIpadApp, country: String? = nil) {
        self.iphone = iphone
        self.ipad = ipad
        self.country = country
    }

    public var metaTags: Node<HTML.HeadContext> {
        .group(
            .metaContent(iphone),
            .metaContent(ipad),
            .twitterMetaTag(name: "twitter:app:country", value: country)
        )
    }
}
