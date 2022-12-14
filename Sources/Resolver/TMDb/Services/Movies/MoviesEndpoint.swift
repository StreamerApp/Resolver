import Foundation

enum MoviesEndpoint {

    static let basePath = URL(string: "/movie")!

    case details(movieID: TMDBMovie.ID)
    case credits(movieID: TMDBMovie.ID)
    case reviews(movieID: TMDBMovie.ID, page: Int? = nil)
    case images(movieID: TMDBMovie.ID)
    case videos(movieID: TMDBMovie.ID)
    case recommendations(movieID: TMDBMovie.ID, page: Int? = nil)
    case similar(movieID: TMDBMovie.ID, page: Int? = nil)
    case nowPlaying(page: Int? = nil)
    case popular(page: Int? = nil)
    case topRated(page: Int? = nil)
    case upcoming(page: Int? = nil)

}

extension MoviesEndpoint: Endpoint {

    var url: URL {
        switch self {
        case .details(let movieID):
            return Self.basePath
                .appendingPathComponent(movieID)
                .appending(["append_to_response": "videos,credits"])

        case .credits(let movieID):
            return Self.basePath
                .appendingPathComponent(movieID)
                .appendingPathComponent("credits")

        case .reviews(let movieID, let page):
            return Self.basePath
                .appendingPathComponent(movieID)
                .appendingPathComponent("reviews")
                .appendingPage(page)

        case .images(let movieID):
            return Self.basePath
                .appendingPathComponent(movieID)
                .appendingPathComponent("images")

        case .videos(let movieID):
            return Self.basePath
                .appendingPathComponent(movieID)
                .appendingPathComponent("videos")

        case .recommendations(let movieID, let page):
            return Self.basePath
                .appendingPathComponent(movieID)
                .appendingPathComponent("recommendations")
                .appendingPage(page)

        case .similar(let movieID, let page):
            return Self.basePath
                .appendingPathComponent(movieID)
                .appendingPathComponent("similar")
                .appendingPage(page)

        case .nowPlaying(let page):
            return Self.basePath
                .appendingPathComponent("now_playing")
                .appendingPage(page)

        case .popular(let page):
            return Self.basePath
                .appendingPathComponent("popular")
                .appendingPage(page)

        case .topRated(let page):
            return Self.basePath
                .appendingPathComponent("top_rated")
                .appendingPage(page)

        case .upcoming(let page):
            return Self.basePath
                .appendingPathComponent("upcoming")
                .appendingPage(page)
        }
    }

}
