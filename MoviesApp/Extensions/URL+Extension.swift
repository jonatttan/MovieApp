//
//  URL+Extension.swift
//  MoviesApp
//
//  Created by Jonattan Sousa on 22/01/24.
//  Copyright © 2024 Jonattan Sousa. All rights reserved.
//

import Foundation

extension URL {
    
    static func forMovies(_ name: String) -> URL? {
        URL(string: "http://www.omdbapi.com/?s=\(name)\(Constants.API_KEY)")
    }
    
    static func forMoviesByImdbId(_ imdbId: String) -> URL? {
        URL(string: "http://www.omdbapi.com/?i=\(imdbId)\(Constants.API_KEY)")
    }
}
