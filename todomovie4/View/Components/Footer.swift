//
//  Footer.swift
//  todomovie4
//
//  Created by Gabriel Lemache Castro on 04/02/22.
//

import SwiftUI

struct Footer: View {
    @State var checked = false
    @EnvironmentObject var viewModel: MovieViewModel
    
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 6)
        HStack {
            ZStack {
                shape.stroke().background(viewModel.isFavorite ? shape.foregroundColor(.white) : nil)
                HStack{
                    Image(systemName: viewModel.heart).resizable()
                        .frame(width: 15,height: 15)
                    Text(viewModel.isFavorite ? "Liked" : "Like")
                }
                .foregroundColor(viewModel.isFavorite ? .black : .white)
                .padding(.vertical, 10.0)
                .padding(.horizontal)
            }
            .onTapGesture { viewModel.isFavorite.toggle()}
            .padding()
        }
        HStack {
            ZStack {
                shape.stroke().background(checked ? shape.foregroundColor(.white) : nil)
                    Text(checked ? "Added" : "Add to My List")
                        .padding(.vertical, 10.0)
                        .padding(.horizontal)
                        .foregroundColor(checked ? .black : .white)
            }
            .onTapGesture { checked.toggle() }
            .padding(.horizontal)
        }
        HStack {
            Text("Made by Gabriel Castro for the Mobile2You team")
                .padding(15.0)
                .multilineTextAlignment(.center)
                .opacity(0.7)
        }
        Spacer(minLength: 30.0)
    }
}
