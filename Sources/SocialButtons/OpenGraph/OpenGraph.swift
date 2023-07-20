//
//  File.swift
//  
//
//  Created by Alan Paiva on 7/16/23.
//

import Foundation
import Plot

public struct OpenGraphInfo {
    let title: String
    let description: String
    let siteName: String
    let url: String
    let type: OpenGraphType
    let image: OpenGraphImage
    let audio: OpenGraphAudio?
    let video: OpenGraphVideo?
    let locale: OpenGraphLocale?
    let determiner: OpenGraphDeterminer?

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
}
