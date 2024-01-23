//
//  MovieListScreen.swift
//  MoviesApp
//
//  Created by Jonattan Sousa on 22/01/24.
//  Copyright © 2024 Jonattan Sousa. All rights reserved.
//

import SwiftUI

struct MovieListScreen: View {
    @ObservedObject private var movieListVM: MovieListViewModel
    @State private var searchText: String = .empty
    
    init() {
        self.movieListVM = MovieListViewModel()
    }
    
    var body: some View {
        VStack {
            TextField("Search", text: $searchText, onEditingChanged: { _ in }, onCommit: {
                self.movieListVM.searchByName(searchText)
            }).textFieldStyle(RoundedBorderTextFieldStyle())
            
            Spacer()
                .navigationBarTitle("Movies")
            
            MovieListView(movies: self.movieListVM.movies)
            
        }.padding().embedNavigationView().animation(.default)
    }
    
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieListScreen()
    }
}
