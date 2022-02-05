//
//  MovieModel.swift
//  todomovie4
//
//  Created by Gabriel Lemache Castro on 04/02/22.
//

import Foundation

struct Movie: Decodable{
    var backdrop_path: String? // image
    var poster_path: String? // image
    var vote_count: Int? // likes
    var original_title: String?
    var popularity: Double?
}

// List of all similar movies
struct MoviesSimiliar: Decodable{
    var page: Int
    var results: [MovieResults]
}

// Each movie from similar movies
struct MovieResults: Decodable, Identifiable, Hashable {
    var idResult: UUID = UUID()
    var id: String?
    var title: String?
    var genre: [Int]?
    var posterPath: String?
    var releaseDate: String?
    
    enum CodingKeys: String, CodingKey{
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case genre = "genre_ids"
        case title
    }
}

// Each genre of all
struct Genre: Decodable, Identifiable, Hashable {
    var id: Int
    var name: String
}

// List of all genres
struct Genres: Decodable{
    var genres: [Genre]
}

struct GeneralData {
    let PrincipalMovieUrl = "https://api.themoviedb.org/3/movie/550?api_key="
    let SimilarMovieUrl = "https://api.themoviedb.org/3/movie/550/similar?api_key="
    let GenreUrl = "https://api.themoviedb.org/3/genre/movie/list?api_key="
    let apiKey = ProcessInfo.processInfo.environment["apiKey"]
}
