//
//  MovieDetailScreen.swift
//  MoviesApp
//
//  Created by Jonattan Sousa on 24/01/24.
//  Copyright © 2024 Jonattan Sousa. All rights reserved.
//

import SwiftUI

struct MovieDetailScreen: View {
    let imdbID: String
    @ObservedObject var movieDetailVM = MovieDetailViewModel()
    
    var body: some View {
        VStack {
            // TODO: - Apply switch here?
            if movieDetailVM.loadingState == .loading {
                LoadingView()
            } else if movieDetailVM.loadingState == .failed {
                FailedView()
            } else if movieDetailVM.loadingState == .success {
                MovieDetailView(movieDetailVM: movieDetailVM)
            }
        }
        .onAppear() {
            movieDetailVM.getDetail(imdbId: imdbID)
        }
    }
}
