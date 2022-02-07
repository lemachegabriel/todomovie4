//
//  ContentView.swift
//  todomovie4
//
//  Created by Gabriel Lemache Castro on 04/02/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: MovieViewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
                Color.black.edgesIgnoringSafeArea(.all)
                Header().environmentObject(viewModel)
                BodyList().environmentObject(viewModel)
                Footer().environmentObject(viewModel)
            }).ignoresSafeArea()
            .onAppear {
                viewModel.fetchPrincipalMovie()
                viewModel.fetchMovieSimilarList()
                viewModel.fetchGenres()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: MovieViewModel())
            .preferredColorScheme(.dark)
    }
}

