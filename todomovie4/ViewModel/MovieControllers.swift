//
//  MovieControllers.swift
//  todomovie4
//
//  Created by Gabriel Lemache Castro on 04/02/22.
//

import Foundation

final class MovieViewModel: ObservableObject {
    @Published var movieSimilarList: [MovieResults] = []
    @Published var movieGeneres: [String] = []
    @Published var genereList: [Geners] = []
    @Published var movie: Movie?
    @Published var movieSimiliar: MoviesSimiliar?
    @Published var isFavorite: Bool = false
    
    var imageName: String { isFavorite ? "heart.fill" : "heart"}
    
    private var apiRepository: MovieApi
    
    init (_ apiRepository: MovieApi = MovieApi()) {
        self.apiRepository = apiRepository
    }
    
    // MARK: Methods
    
    func fetchMovieSimilarList() {
        apiRepository.getSimiliarMoviesById() { item in
            item.results.forEach { movies in
                // Save all movies in the model
                self.movieSimilarList.append(
                    MovieResults(
                        id: movies.id,
                        title: movies.title,
                        genre: movies.genre,
                        posterPath: movies.posterPath,
                        releaseDate: movies.releaseDate
                    )
                )
            }
        }
    }

    func fetchGeneres() {
        apiRepository.getGeners { list in
            list.genres.forEach { geners in
                self.genereList.append(Geners(id: geners.id, name: geners.name))
            }
        }
    }
    
    func getGenerers(indexs: [Int]) -> [String] {
        var arrayGeners: [String] = []
        indexs.forEach { item in
            let genero = genereList.filter({$0.id == item }).map({$0.name})
            if arrayGeners.count < 2 {
                arrayGeners.append(genero[0])
            }
            return
        }
        return arrayGeners
    }
}
