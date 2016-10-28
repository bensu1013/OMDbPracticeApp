//
//  Movie.swift
//  OMDbPractice
//
//  Created by Benjamin Su on 10/26/16.
//  Copyright © 2016 Benjamin Su. All rights reserved.
//

import Foundation
import UIKit

class Movie {
    
    var title: String = ""
    var year: String = ""
    var rated: String = ""
    var genre: String = ""
    var imdbRating: String = ""

    var poster: String = ""
    var posterImage: UIImage?
    
    var hasImage: Bool = false
    
    init(info: [String : String] ) {
        
        if let _title = info["Title"] {
            self.title = _title
        }
        if let _year = info["Year"] {
            self.year = _year
        }
        if let _rated = info["Rated"] {
            self.rated = _rated
        }
        if let _genre = info["Genre"] {
            self.genre = _genre
        }
        if let _imdbRating = info["imdbRating"] {
            self.imdbRating = _imdbRating
        }
        if let _poster = info["Poster"] {
            self.poster = _poster
        }
        if poster != "N/A" {
            self.hasImage = true
        }
    }
    
    
    
    
    
}
