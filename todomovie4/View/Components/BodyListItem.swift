//
//  BodyListItem.swift
//  todomovie4
//
//  Created by Gabriel Lemache Castro on 04/02/22.
//

import SwiftUI

struct BodyListItem: View {
    @State var checked: Bool
    var title: String
    var date: String
    var image: String
    var geners: [String]
    let imageBaseUrl = "https://image.tmdb.org/t/p/original/"
    
    var body: some View {
        HStack{
            Image(uiImage: "\(imageBaseUrl)\(image)".load())
                .resizable()
                .frame(
                    width: 60,
                    height: 100
                )
            VStack(alignment: .leading) {
                Text(title)
                    .foregroundColor(.primary)
                    .font(.system(size: 20))
                HStack{
                    Text(date.prefix(4))
                        .foregroundColor(.primary)
                        .font(.system(size: 14))
                    ForEach(geners, id: \.self) { item in
                        Text(item)
                            .foregroundColor(.primary)
                            .font(.system(size: 14))
                    }
                }
            }.padding(10)
            Spacer()
            Button {
                checked.toggle()
            } label: {
                Image(systemName: self.checked ? "checkmark.circle.fill" : "checkmark.circle")
                    .resizable()
                    .foregroundColor(.primary)
                    .frame(
                        width: 15,
                        height: 15
                    )
            }.padding(.trailing,20)
        }.padding(0)
    }
}

