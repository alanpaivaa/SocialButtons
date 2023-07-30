//
//  OpenGraphMetadata.swift
//  
//
//  Created by Alan Paiva on 7/16/23.
//

import Foundation
import Plot

/// Description of Open Graph meta tags to be rendered in a website
public struct OpenGraphMetadata: MetaTaggableContent {
    private let title: String
    private let description: String
    private let siteName: String
    private let url: String
    private let type: OpenGraphType
    private let image: OpenGraphImage
    private let audio: OpenGraphAudio?
    private let video: OpenGraphVideo?
    private let locale: OpenGraphLocale?
    private let determiner: OpenGraphDeterminer?

    /// Initializer
    ///
    /// - Parameters:
    ///   - title: **og:title**, the title of your object as it should appear within the graph
    ///   - description: **og:description**, a one to two sentence description of your object
    ///   - siteName: **og:site_name**, if your object is part of a larger web site, the name which should be displayed for the overall site
    ///   - url: **og:url**, the canonical URL of your object that will be used as its permanent ID in the graph
    ///   - type: **og:type**, the type of your object, see ``OpenGraphType``
    ///   - image: **og:image**, an image URL which should represent your object within the graph, see ``OpenGraphImage``
    ///   - audio: **og:audio**, a URL to an audio file to accompany this object, see ``OpenGraphAudio``
    ///   - video: **og:video**, a URL to a video file that complements this object, see ``OpenGraphVideo``
    ///   - locale: **og:locale**, the locale these tags are marked up in, using the format `language_TERRITORY`, see ``OpenGraphLocale``
    ///   - determiner: **og:determiner**, the word that appears before this object's title in a sentence, see ``OpenGraphDeterminer``
    public init(title: String,
                description: String,
                siteName: String,
                url: String,
                type: OpenGraphType,
                image: OpenGraphImage,
                audio: OpenGraphAudio? = nil,
                video: OpenGraphVideo? = nil,
                locale: OpenGraphLocale? = nil,
                determiner: OpenGraphDeterminer? = nil) {
        self.title = title
        self.description = description
        self.siteName = siteName
        self.url = url
        self.type = type
        self.image = image
        self.audio = audio
        self.video = video
        self.locale = locale
        self.determiner = determiner
    }

    public var metaTags: Node<HTML.HeadContext> {
        .group(
            .comment("Open Graph Metadata"),
            .openGraphMetaTag(property: "og:title", content: title),
            .openGraphMetaTag(property: "og:description", content: description),
            .openGraphMetaTag(property: "og:site_name", content: siteName),
            .openGraphMetaTag(property: "og:url", content: url),
            .metaContent(type),
            .metaContent(image),
            .metaContent(audio),
            .metaContent(video),
            .metaContent(locale),
            .metaContent(determiner)
        )
    }
}
