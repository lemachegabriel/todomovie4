//
//  BodyList.swift
//  todomovie4
//
//  Created by Gabriel Lemache Castro on 04/02/22.
//

import SwiftUI

struct BodyList: View {
    @EnvironmentObject var viewModel: MovieViewModel
    
    var body: some View {
        VStack{
            ForEach(viewModel.movieSimilarList, id: \.self) { movie in
                BodyListItem(
                    checked: viewModel.isAdded,
                    title: movie.title ?? "",
                    date: movie.releaseDate ?? "",
                    image: movie.posterPath ?? "",
                    geners: viewModel.getGenerers(indexs: movie.genre ?? [])
                )
            }
        }
    }
}
