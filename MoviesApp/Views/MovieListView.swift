//
//  MovieListView.swift
//  MoviesApp
//
//  Created by Jonattan Sousa on 22/01/24.
//  Copyright © 2024 Jonattan Sousa. All rights reserved.
//

import SwiftUI

struct MovieListView: View {
    let movies: [MovieViewModel]
    var body: some View {
        
        List(self.movies, id: \.imdbId) { movie in
            NavigationLink(destination: MovieDetailScreen(imdbID: movie.imdbId)) {
                MovieCell(movie: movie)
            }
        }
        
    }
}

struct MovieListView_Preview: PreviewProvider {
    static var previews: some View {
        MovieListView(movies: MockMovies.movies)
    }
}

fileprivate struct MockMovies {
    static let movies: [MovieViewModel] = {
        var movieList = [MovieViewModel]()
        movieList.append(MovieViewModel(movie: Movie(title: "Mock1",
                                                     year: "0001",
                                                     imdbId: "yxz",
                                                     poster: "https://fyrafix.files.wordpress.com/2011/08/url-8.jpg")))
        movieList.append(MovieViewModel(movie: Movie(title: "Mock2",
                                                     year: "0002",
                                                     imdbId: "zxy",
                                                     poster: "https://fyrafix.files.wordpress.com/2011/08/url-9.jpg")))
        return movieList
    }()
}
