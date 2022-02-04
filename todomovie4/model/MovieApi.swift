//
//  MovieApi.swift
//  todomovie4
//
//  Created by Gabriel Lemache Castro on 04/02/22.
//

import SwiftUI

class MovieApi{
    private var apiKey : String = GeneralData().apiKey ?? ""
        
    // Get the principal movie data and returns to ../ViewModel/MovieControllers
    func getPrincipalMovie(completion: @escaping (Movie) -> ()){
        guard let url = URL(string: "\(GeneralData().PrincipalMovieUrl)\(apiKey)")else{return}
        
        URLSession.shared.dataTask(with: url) { data, res, err in
            
            //Convert response to JSON
            let movies = try! JSONDecoder().decode(Movie.self, from: data!)
            
            //Update UI on the main thread
            DispatchQueue.main.async {
                completion(movies)
            }
            
        }.resume()
    }
    
    // Get the array of movies similar to principal and returns to ../ViewModel/MovieControllers
    func getSimiliarMoviesById(completion: @escaping (MoviesSimiliar) -> ()){
        guard let url = URL(string: "\(GeneralData().SimilarMovieUrl)\(apiKey)")else{return}
        
        URLSession.shared.dataTask(with: url) { data, res, err in
            
            //Convert response to JSON
            let dataRequest = try! JSONDecoder().decode(MoviesSimiliar.self, from: data!)
            
            //Update UI on the main thread
            DispatchQueue.main.async {
                completion(dataRequest)
            }
        }.resume()
    }
    
    // Get the list of genres and returns to ../ViewModel/MovieControllers
    func getGeners(completion: @escaping (Genrens) ->()) {
        guard let url = URL(string: "\(GeneralData().GenreUrl)\(apiKey)")else{return}
        
        URLSession.shared.dataTask(with: url) { data, res, err in
            
            //Convert response to JSON
            let geners = try! JSONDecoder().decode(Genrens.self, from: data!)
            
            //Update UI on the main thread
            DispatchQueue.main.async {
                completion(geners)
            }
        }.resume()
    }
}

