//
//  MovieDetail.swift
//  MoviesApp
//
//  Created by Jonattan Sousa on 23/01/24.
//  Copyright © 2024 Jonattan Sousa. All rights reserved.
//

import Foundation

struct MovieDetail: Decodable {
    
    let title: String
    let year: String
    let poster: String
    let rated: String
    let plot: String
    let director: String
    let actors: String
    let imdbRating: String
    let imdbId: String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case poster = "Poster"
        case rated = "Rated"
        case plot = "Plot"
        case director = "Director"
        case actors = "Actors"
        case imdbRating = "imdbRating"
        case imdbId = "imdbID"
    }
}
