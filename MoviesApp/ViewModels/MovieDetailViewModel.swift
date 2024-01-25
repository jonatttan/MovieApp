//
//  MovieDetailViewModel.swift
//  MoviesApp
//
//  Created by Jonattan Sousa on 23/01/24.
//  Copyright © 2024 Jonattan Sousa. All rights reserved.
//

import Foundation

class MovieDetailViewModel: ViewModelBase {
    private var movieDetail: MovieDetail?
    private var httpClient: HTTPClient
    
    init(movieDetail: MovieDetail? = nil) {
        self.movieDetail = movieDetail
        self.httpClient = HTTPClient()
        super.init()
        loadingState = .loading
    }
    
    func getDetail(imdbId: String) {
        self.httpClient.getMovieDetailsBy(imdbId: imdbId) { result in
            
            switch result {
            case .success(let movieDetail):
                DispatchQueue.main.async {
                    self.movieDetail = movieDetail
                    self.loadingState = .success
                }
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.loadingState = .failed
                }
            }
            
        }
    }
    
    var title: String {
        self.movieDetail?.title ?? .empty
    }
    
    var poster: String {
        self.movieDetail?.poster ?? .empty
    }
    
    var plot: String {
        self.movieDetail?.plot ?? .empty
    }
    
    var rating: Int {
        get {
            // TODO: - Verify possibility to the guard use
            let ratingAsDouble = Double(self.movieDetail?.imdbRating ?? "0.0")
            return Int(ceil(ratingAsDouble ?? 0.0))
        }
    }
    
    var director: String {
        self.movieDetail?.director ?? .empty
    }
}
