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

struct MoviesSimiliar: Decodable{
    var page: Int
    var results: [MovieResults]
}


struct Geners: Decodable, Identifiable, Hashable {
    var id: Int
    var name: String
}

struct Genrens: Decodable{
    var genres: [Geners]
}
