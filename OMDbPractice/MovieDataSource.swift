//
//  MovieDataStore.swift
//  OMDbPractice
//
//  Created by Benjamin Su on 10/26/16.
//  Copyright © 2016 Benjamin Su. All rights reserved.
//

import Foundation



class MovieDataStore {
    
    static let sharedInstance = MovieDataStore()
    
    var movies: [Movie] = []
    
    private init() {}
    
    func loadMovieDataStore(completion: @escaping () -> () ) {
        
        OMDbAPI.getOMDbInfo(urlString: "http://www.omdbapi.com/?t=Frozen&y=&plot=full&r=json") { (data) in
            if !data.keys.contains("Error"){
                self.movies.append(Movie(info: data))
                completion()
            }
            
        }
    }
    
    
    
}
