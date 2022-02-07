//
//  MovieControllers.swift
//  todomovie4
//
//  Created by Gabriel Lemache Castro on 04/02/22.
//

import Foundation

final class MovieViewModel: ObservableObject {
    
    // Make these vars visibles for the UI
    @Published var movieSimilarList: [MovieResults] = []
    @Published var movieGeneres: [String] = []
    @Published var genreList: [Genre] = []
    @Published var movie: Movie?
    @Published var movieSimiliar: MoviesSimiliar?
    @Published var isFavorite: Bool = false
    @Published var isAdded: Bool = false
    
    var heart: String { isFavorite ? "heart.fill" : "heart"}
    
    private var apiRepository: MovieApi
    
    init (_ apiRepository: MovieApi = MovieApi()) {
        self.apiRepository = apiRepository
    }
    
    // MARK: Methods
    
    // Request principal movie
    func fetchPrincipalMovie(){
        apiRepository.getPrincipalMovie() { movie in
            self.movie = movie
        }
    }
    
    // Request the principal movie similar list
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
    
    // Request the list of all genres
    func fetchGenres() {
        apiRepository.getGenres { list in
            list.genres.forEach { genre in
                self.genreList.append(Genre(id: genre.id, name: genre.name))
            }
        }
    }
    
    // Organize genres in 2 for each film in the similar list
    func getGenerers(indexs: [Int]) -> [String] {
        var arrayGenres: [String] = []
        indexs.forEach { item in
            let genero = genreList.filter({$0.id == item }).map({$0.name})
            if arrayGenres.count == indexs.count {
                return
            }
            if arrayGenres.count < 2 {
                if(genero.count > 0){
                    arrayGenres.append(genero[0])
                }
            }
            return
        }
        return arrayGenres
    }
}
