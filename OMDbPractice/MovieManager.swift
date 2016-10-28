//
//  MovieManager.swift
//  OMDbPractice
//
//  Created by Benjamin Su on 10/27/16.
//  Copyright © 2016 Benjamin Su. All rights reserved.
//

import Foundation
import UIKit

//
//
//class MovieManager: UITableViewDelegate, UITableViewDataSource  {
//
//    
//    var selectedRows
//    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        
//        
//        
//        if selectedRows.contains(indexPath.row) {
//            return 300
//        } else {
//            return 44
//        }
//    }
//    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return dataStore.movies.count
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieTableViewCell
//        
//        let movie = dataStore.movies[indexPath.row]
//        
//        cell.populateLabels(movie: movie)
//        
//        if movie.posterImage != nil {
//            cell.posterView.image = movie.posterImage
//        }
//        
//        if selectedRows.contains(indexPath.row) {
//            cell.prepCell(forSelection: true, movie: movie)
//        } else {
//            cell.prepCell(forSelection: false, movie: movie)
//        }
//        
//        
//        return cell
//    }
//    
//    
//    
//    
//    
//    
//    
//}



