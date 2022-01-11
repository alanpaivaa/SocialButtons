# SocialButtons

A plugin for [Publish](https://github.com/JohnSundell/Publish) that allows you to easily embed social buttons (e.g. Tweet button) in your site.

## Installation
Add it as a dependency in `Package.swift`:

```swift
let package = Package(
    ...

    dependencies: [
        .package(url: "https://github.com/alanpaivaa/SocialButtons", from: "0.1.0")
    ],
    targets: [
        .target(
            name: "AmazingBlog",
            dependencies: [
                "SocialButtons"
            ]
        )
    ]
)
```

## Usage

### TweetButton
A [Tweet button](https://developer.twitter.com/en/docs/twitter-for-websites/tweet-button/overview) allows users easily share content from your site.

```swift
TweetButton(
    style: .small,                          // Choose small or large size
    text: "Check out my amazing article!",  // Text to be shared on the tweet
    hashTags: ["engineering", "swift"],     // Hash tags to be added on the tweet
    via: "alanpaivaa",                      // Twitter account for attribution
    related: ["other_user"]                 // Twitter accounts related to the shared content
)
```

To render the default Tweet button widget, it's also necessary to load the Twitter widget script:

```swift
HTML(
    .head(
        ...
        .loadTwitterWidgets()
    ),
    ...
)
```

If you need to customize the button, you can use a regular `Link` and build the Tweet url with `TweetURLGenerator`. In that case, it's also needed to set the `url` parameter pointing to the page to share.


## Contribute

This project is in its early development and community is highly encouraged to contribute, either by adding more components, fixing bugs or improving documentation. Thus, feel free to go ahead and create a Pull Request! 💯

I hope you enjoy it, thank you!
