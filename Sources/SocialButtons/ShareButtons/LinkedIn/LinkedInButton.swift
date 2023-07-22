//
//  File.swift
//  
//
//  Created by Alan Paiva on 7/11/23.
//

import Foundation
import Plot

/// Renders a LinkedIn share button
public struct LinkedInButton: Component {
    private let url: URLRepresentable

    /// Initializer
    ///
    /// - Parameter url: The url to be shared
    public init(url: URLRepresentable) {
        self.url = url
    }

    public var body: Component {
        Span {
            Element(name: "script") { Text("lang: en_US") }
                .attribute(named: "src", value: "https://platform.linkedin.com/in.js")
                .attribute(named: "type", value: "text/javascript")

            Element(name: "script") {}
                .attribute(named: "type", value: "IN/Share")
                .attribute(named: "data-url", value: url.description)
        }
    }
}
