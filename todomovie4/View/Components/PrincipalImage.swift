//
//  PrincipalImage.swift
//  todomovie4
//
//  Created by Gabriel Lemache Castro on 06/02/22.
//

import SwiftUI

struct PrincipalImage: View {
    @ObservedObject var urlImageModel: UrlImageModel
    @State var offset: CGFloat = 0
    let defaultImage = UIImage(systemName: "icloud.and.arrow.up.fill")
    
    internal let imageEffect: LinearGradient = LinearGradient(
        gradient: Gradient(colors: [Color.black,Color.clear]),
        startPoint: .center, endPoint: .bottom
    )
    
    init(urlString: String?) {
        urlImageModel = UrlImageModel(urlString: urlString)
    }
    var body: some View {
        VStack(spacing: 15){
            //Principal movie Image
            GeometryReader{geo -> AnyView in
                let minY = geo.frame(in: .global).minY
                DispatchQueue.main.async {
                    self.offset = minY
                }
                return AnyView(
                    ZStack{
                        Image(uiImage: urlImageModel.image ?? defaultImage!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: getRect().width, height: minY > 0 ? 480 + minY : nil, alignment: .center)
                            .mask(imageEffect)
                    }
                        .frame(height: minY > 0 ? 480 + minY : 480)
                        .offset(y: minY > 0 ? -minY : 0)
                )
            }
        }
        .frame(height: 480)
    }
}
