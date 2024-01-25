//
//  MovieCell.swift
//  MoviesApp
//
//  Created by Jonattan Sousa on 22/01/24.
//  Copyright © 2024 Jonattan Sousa. All rights reserved.
//

import SwiftUI

struct MovieCell: View {
    let movie: MovieViewModel
    
    var body: some View {
        HStack(alignment: .top) {
            URLImage(url: movie.poster)
                .frame(width: 100, height: 120)
                .cornerRadius(6)
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.headline)
                Text(movie.year)
                    .opacity(0.4)
                    .padding(.top, 10)
            }.padding(5)
            Spacer()
        }.contentShape(Rectangle())
    }
}

struct MovieCell_Preview: PreviewProvider {
    static var previews: some View {
        MovieCell(movie: MockMovie.movie)
    }
    
}

fileprivate struct MockMovie {
    static let movie: MovieViewModel = {
        return MovieViewModel(movie: Movie(title: "Mock1",
                                           year: "0001",
                                           imdbId: "yxz",
                                           poster: "https://fyrafix.files.wordpress.com/2011/08/url-8.jpg"))
    }()
}
