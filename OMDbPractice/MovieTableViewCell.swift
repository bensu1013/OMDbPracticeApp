//
//  MovieTableViewCell.swift
//  OMDbPractice
//
//  Created by Benjamin Su on 10/26/16.
//  Copyright © 2016 Benjamin Su. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var posterView: UIImageView!
    
    @IBOutlet weak var yearLabel: UILabel!
    
    @IBOutlet weak var ratedLabel: UILabel!
    
    @IBOutlet weak var genreLabel: UILabel!
    
    @IBOutlet weak var imdbRatingLabel: UILabel!
    
    @IBOutlet weak var detailedStackView: UIStackView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        posterView.layer.borderWidth = 4
        posterView.layer.borderColor = UIColor.black.cgColor
        
        self.layer.borderWidth = 4
        self.layer.borderColor = UIColor.cyan.cgColor
        
        posterView.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       
        
    }
    
    
    func prepCell(forSelection selected: Bool, movie: Movie) {
        
        if selected {
            detailedStackView.isHidden = false
            posterView.isHidden = false
            
        } else {
            detailedStackView.isHidden = true
            posterView.isHidden = true
        }
    }
    
    
    func populateLabels(movie: Movie) {
        self.titleLabel.text = movie.title
        self.yearLabel.text = movie.year
        self.ratedLabel.text = movie.rated
        self.genreLabel.text = movie.genre
        self.imdbRatingLabel.text = movie.imdbRating
        
        if movie.hasImage {
            posterView.image = movie.posterImage
        }
        
    }
    
    
}




enum cellState {
    case selected
    case unselected
}




