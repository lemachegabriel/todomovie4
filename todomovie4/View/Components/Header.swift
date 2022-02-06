//
//  Header.swift
//  todomovie4
//
//  Created by Gabriel Lemache Castro on 04/02/22.
//

import SwiftUI

struct Header: View {
    @EnvironmentObject var viewModel: MovieViewModel
    @State var heartPositionY: CGFloat = 0
    @State var heartPositionX: CGFloat = 0
    @State var heartOpacity: Double = 1.0
    private let imageBaseUrl = "https://image.tmdb.org/t/p/original/"
    
    internal let imageEffect: LinearGradient = LinearGradient(
        gradient: Gradient(colors: [Color.black,Color.clear]),
        startPoint: .center, endPoint: .bottom
    )
    
    func TapHeart(){
        viewModel.isFavorite.toggle()
        
        if viewModel.isFavorite{
            heartPositionY = 30.0
            heartPositionX = -320.0
            heartOpacity = 0
        }else{
            heartPositionY = 0
            heartPositionX = 0
            heartOpacity = 1
        }
    }
    
    var body: some View {
        VStack(){
            //Principal movie Image
            Image(uiImage: "\(imageBaseUrl)\(viewModel.movie?.poster_path ?? "")".load())
                .resizable()
                .scaledToFit()
                .padding(.top, -20)
                .mask(imageEffect)
            HStack {
                //Principal movie name
                Text(viewModel.movie?.original_title ?? "").foregroundColor(.primary)
                    .font(.system(size: 24))
                    .fontWeight(.black)
                    .padding(.leading, 20)
                Spacer()
                //Heart button
                ZStack{
                    Image(systemName: viewModel.heart)
                        .resizable()
                        .frame(width: 20,height: 20)
                        .foregroundColor(.primary)
                        .padding(.trailing, 20)
                        .animation(.linear(duration: 0.5))
                    Image(systemName: viewModel.heart)
                        .resizable()
                        .frame(width: 20,height: 20)
                        .foregroundColor(.primary)
                        .padding(.trailing, 20)
                        .offset(x: (heartPositionX) ,y: (heartPositionY))
                        .opacity(heartOpacity)
                        .animation(.linear(duration: 0.5))
                }
                .onTapGesture {
                    TapHeart()
                }
            }
            HStack(alignment: .firstTextBaseline) {
                HStack{
                    Image(systemName: "suit.heart.fill").resizable()
                        .frame(width: 15,height: 15)
                        .foregroundColor(.primary)
                    Text(String(format: "%@ Likes",String(viewModel.movie?.vote_count ?? 0)))
                        .foregroundColor(.primary)
                        .font(.system(size: 16))
                }
                HStack{
                    Image(systemName: "list.star").resizable()
                        .frame(width: 15,height: 15)
                        .foregroundColor(.primary)
                    Text("\((viewModel.movie?.popularity ?? 0.0).formatToK())K Lists")
                        .foregroundColor(.primary)
                        .font(.system(size: 16))
                }.padding(.leading,20)
                Spacer()
            }.padding(.horizontal,20)
        }
    }
}
