//
//  Created by Alan Paiva on 1/9/22.
//

import Plot

public extension Node where Context: HTMLScriptableContext {
    /// Injects a script that loads other scripts needed for loading Twitter widgets.
    static func loadTwitterWidgets() -> Node {
        .script(
            .init(
                stringLiteral: #"window.twttr = (function(d, s, id) {var js, fjs = d.getElementsByTagName(s)[0],t = window.twttr || {};if (d.getElementById(id)) return t;js = d.createElement(s);js.id = id;js.src = "https://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js, fjs);t._e = [];t.ready = function(f) {t._e.push(f);};return t;}(document, "script", "twitter-wjs"));"#
            )
        )
    }
}
