//
//  OpenGraphType.swift
//  
//
//  Created by Alan Paiva on 7/16/23.
//

import Foundation
import Plot

/// Open Graph metadata dype, **og:type**
public enum OpenGraphType: MetaTaggableContent {
    /// music.album
    case album(OpenGraphTypeAlbum)

    /// article
    case article(OpenGraphTypeArticle)

    /// book
    case book(OpenGraphTypeBook)

    /// video.episode
    case episode(OpenGraphTypeEpisode)

    /// video.movie
    case movie(OpenGraphTypeMovie)

    /// video.other
    case otherVideo(OpenGraphTypeVideoOther)

    /// music.playlist
    case playlist(OpenGraphTypePlaylist)

    /// profile
    case profile(OpenGraphTypeProfile)

    /// music.radio_station
    case radioStation(OpenGraphTypeRadioStation)

    /// music.song
    case song(OpenGraphTypeSong)

    /// video.tv_show
    case tvShow(OpenGraphTypeTVShow)

    /// website
    case website

    public var metaTags: Node<HTML.HeadContext> {
        switch self {
        case .article(let article):
            return article.metaTags
        case .album(let album):
            return album.metaTags
        case .book(let book):
            return book.metaTags
        case .episode(let episode):
            return episode.metaTags
        case .movie(let movie):
            return movie.metaTags
        case .otherVideo(let video):
            return video.metaTags
        case .playlist(let playlist):
            return playlist.metaTags
        case .profile(let profile):
            return profile.metaTags
        case .radioStation(let radioStation):
            return radioStation.metaTags
        case .song(let song):
            return song.metaTags
        case .tvShow(let tvShow):
            return tvShow.metaTags
        case .website:
            return .openGraphMetaTag(property: "og:type", content: "website")
        }
    }
}
