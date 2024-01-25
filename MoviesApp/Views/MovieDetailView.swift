//
//  MovieDetailView.swift
//  MoviesApp
//
//  Created by Jonattan Sousa on 24/01/24.
//  Copyright © 2024 Jonattan Sousa. All rights reserved.
//

import SwiftUI

struct MovieDetailView: View {
    let movieDetailVM: MovieDetailViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            URLImage(url: movieDetailVM.poster)
            Text(movieDetailVM.title)
                .font(.title)
            Text(movieDetailVM.plot)
            Text("Director")
                .fontWeight(.bold)
            Text(movieDetailVM.director)
            HStack {
                Rating(rating: .constant(movieDetailVM.rating))
                Text("\(movieDetailVM.rating)/10")
            }
        }.padding().navigationBarTitle(movieDetailVM.title)
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movieDetailVM: MockMoviewDetailViewModel.movie)
    }
}

fileprivate struct MockMoviewDetailViewModel {
    static let movie: MovieDetailViewModel = {
        MovieDetailViewModel(movieDetail: MovieDetail(title: "Oppenheimer",
                                                      year: "2023",
                                                      poster: "htt://pbs.twimg.com/media/FvUVt3hXgAAxP1H?format=jpg&name=900x900",
                                                      rated: "PG-14",
                                                      plot: "The story of American scientist J. Robert Oppenheimer and his role in the development of the atomic bomb.",
                                                      director: "Christopher Nolan",
                                                      actors: "Cillian Murphy, Emily Blunt, Matt Damon, Robert Browney Jr., Florence Pugh",
                                                      imdbRating: "8",
                                                      imdbId: "tt0567"))
    }()
}
