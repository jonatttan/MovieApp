//
//  HTTPClient.swift
//  MoviesApp
//
//  Created by Jonattan Sousa on 22/01/24.
//  Copyright © 2024 Jonattan Sousa. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case badURL, noData, decodingError
}

class HTTPClient {
    func getMovies(search: String, completion: @escaping(Result<[Movie]?, NetworkError>) -> Void) {
        
        guard let url = URL.forMovies(search) else {
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
        
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            guard let movieResponse = try? JSONDecoder().decode(MovieResponse.self, from: data) else {
                return completion(.failure(.decodingError))
            }
            
            completion(.success(movieResponse.movies))
            
        }.resume()
    }
    
    func getMovieDetailsBy(imdbId: String, completion: @escaping (Result<MovieDetail, NetworkError>) -> Void) {
        
        guard let url = URL.forMoviesByImdbId(imdbId) else {
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            guard let movieDetail = try? JSONDecoder().decode(MovieDetail.self, from: data) else {
                return completion(.failure(.decodingError))
            }
            
            completion(.success(movieDetail))
            
        }.resume()
        
    }
}
