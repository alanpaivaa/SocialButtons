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
    case article
    case episode(OpenGraphTypeEpisode)
    case movie(OpenGraphTypeMovie)
    case otherVideo(OpenGraphTypeVideoOther)
    case playlist(OpenGraphTypePlaylist)
    case radioStation(OpenGraphTypeRadioStation)
    case song(OpenGraphTypeSong)
    case tvShow(OpenGraphTypeTVShow)
    case website

    var metaTags: Node<HTML.HeadContext> {
        switch self {
        case .article:
            fatalError()
        case .episode(let episode):
            return episode.metaTags
        case .album(let album):
            return album.metaTags
        case .movie(let movie):
            return movie.metaTags
        case .otherVideo(let video):
            return video.metaTags
        case .playlist(let playlist):
            return playlist.metaTags
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
