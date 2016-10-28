//
//  MoviesTableViewController.swift
//  OMDbPractice
//
//  Created by Benjamin Su on 10/26/16.
//  Copyright © 2016 Benjamin Su. All rights reserved.
//

import UIKit

class MoviesTableViewController: UITableViewController {

    let dataStore = MovieDataStore.sharedInstance
    var selectedRows: [Int] = []
//    let movieManager = MovieManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.delegate = movieManager
//        tableView.dataSource = movieManager

        dataStore.loadMovieDataStore {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if selectedRows.contains(indexPath.row) {
            return 300
        } else {
            return 44
        }
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataStore.movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieTableViewCell
        
        let movie = dataStore.movies[indexPath.row]
        
        cell.populateLabels(movie: movie)
        
        if movie.posterImage != nil {
            cell.posterView.image = movie.posterImage
        }
        
        if selectedRows.contains(indexPath.row) {
            cell.prepCell(forSelection: true, movie: movie)
        } else {
            cell.prepCell(forSelection: false, movie: movie)
        }
        
        
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if dataStore.movies[indexPath.row].hasImage && dataStore.movies[indexPath.row].posterImage == nil {
            getImage(forIndex: indexPath.row)
        }
        if !selectedRows.contains(indexPath.row) {
            selectedRows.append(indexPath.row)
        } else {
            let removeInd = selectedRows.index(of: indexPath.row)
            selectedRows.remove(at: removeInd!)
        }
        tableView.reloadData()
    }
    
    
    func getImage(forIndex index: Int) {
        print(1)
        let posterURL = dataStore.movies[index].poster
        
        OMDbAPI.getMovieImage(posterURL: posterURL) { (movieImage) in
            DispatchQueue.main.async {
                self.dataStore.movies[index].posterImage = movieImage
                self.tableView.reloadData()
            }
            
        }
    }
}






