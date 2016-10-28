//
//  ViewController.swift
//  OMDbPractice
//
//  Created by Benjamin Su on 10/26/16.
//  Copyright © 2016 Benjamin Su. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let dataStore = MovieDataStore.sharedInstance
    var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let gesture = UITapGestureRecognizer(target: self, action: #selector(getImage))
        gesture.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(gesture)
        
        imageView = UIImageView(frame: self.view.frame)
        imageView.isUserInteractionEnabled = false
        self.view.addSubview(imageView)
        
        dataStore.loadMovieDataStore {
            DispatchQueue.main.async {
                
            }
            
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getImage() {
        
        let posterURL = dataStore.movies[0].poster
        
        OMDbAPI.getMovieImage(posterURL: posterURL) { (movieImage) in
            
            DispatchQueue.main.async {
                self.imageView.image = movieImage
            }
        }
        
        
    }

}

