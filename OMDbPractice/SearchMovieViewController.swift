//
//  SearchMovieViewController.swift
//  OMDbPractice
//
//  Created by Benjamin Su on 10/27/16.
//  Copyright © 2016 Benjamin Su. All rights reserved.
//

import UIKit
import Foundation

class SearchMovieViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var searchButton: UIButton!
    
    let dataStore = MovieDataStore.sharedInstance
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.delegate = self
        searchButton.alpha = 0.5
        searchButton.isUserInteractionEnabled = false
        titleTextField.becomeFirstResponder()
        
    }

    @IBAction func cancelButtonAction(_ sender: UIButton) {
        self.dismiss(animated: true) { 
            
        }
    }
    
    @IBAction func searchButtonAction(_ sender: UIButton) {
        
        searchMovieData { success in
            if success {
                DispatchQueue.main.async {
                    self.dismiss(animated: true) {  }
                }
                
            } else {
                print(1)
                self.titleLabel.text = "Couldn't find movie!"
            }
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text != "" {
            searchButton.alpha = 1
            searchButton.isUserInteractionEnabled = true
        } else {
            searchButton.alpha = 0.5
            searchButton.isUserInteractionEnabled = false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text != "" {
            searchButton.alpha = 1
            searchButton.isUserInteractionEnabled = true
        } else {
            searchButton.alpha = 0.5
            searchButton.isUserInteractionEnabled = false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func searchMovieData(completion: @escaping (Bool) -> () ) {
        let title = changeInputToString()
        OMDbAPI.getOMDbInfo(urlString: "http://www.omdbapi.com/?t=\(title)&y=&plot=full&r=json") { (data) in
            if !data.keys.contains("Error") {
            
                self.dataStore.movies.append(Movie(info: data))
                completion(true)
            } else {
                completion(false)
            }
            
        }
    }
 
    func changeInputToString() -> String {
        let titleString = titleTextField.text?.characters.map { return $0 == " " ? "+" : $0 }

        var title = ""
        for char in titleString! {
            title += "\(char)"
        }
        return title
    }
    

}












