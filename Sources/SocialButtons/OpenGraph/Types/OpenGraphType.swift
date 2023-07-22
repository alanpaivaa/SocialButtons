//
//  OpenGraphType.swift
//  
//
//  Created by Alan Paiva on 7/16/23.
//

import Foundation
import Plot

public enum OpenGraphType: OpenGraphContent {
    case album(OpenGraphTypeAlbum)
    case article(OpenGraphTypeArticle)
    case book(OpenGraphTypeBook)
    case episode(OpenGraphTypeEpisode)
    case movie(OpenGraphTypeMovie)
    case otherVideo(OpenGraphTypeVideoOther)
    case playlist(OpenGraphTypePlaylist)
    case profile(OpenGraphTypeProfile)
    case radioStation(OpenGraphTypeRadioStation)
    case song(OpenGraphTypeSong)
    case tvShow(OpenGraphTypeTVShow)
    case website

    var metaTags: Node<HTML.HeadContext> {
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
            return .openGraphMetaTag(named: "og:type", value: "website")
        }
    }
}
