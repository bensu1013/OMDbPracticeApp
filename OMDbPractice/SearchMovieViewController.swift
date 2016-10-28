//
//  SearchMovieViewController.swift
//  OMDbPractice
//
//  Created by Benjamin Su on 10/27/16.
//  Copyright © 2016 Benjamin Su. All rights reserved.
//

import UIKit
import Foundation

class SearchMovieViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var searchButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    let dataStore = MovieDataStore.sharedInstance
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.delegate = self
        searchButton.alpha = 0.5
        searchButton.isUserInteractionEnabled = false
        titleTextField.becomeFirstResponder()
        errorLabel.alpha = 0.0
        errorLabel.text = "Sorry, couldn't find the movie."
    }

    @IBAction func cancelButtonAction(_ sender: UIButton) {
        self.dismiss(animated: true) { 
            
        }
    }
    
    @IBAction func searchButtonAction(_ sender: UIButton) {
        
        searchMovieData { success in
            if success {
                DispatchQueue.main.async {
                    self.dismiss(animated: true, completion: { 
                        
                    })
                }

                
            } else {
                DispatchQueue.main.async {
                    UIView.animate(withDuration: 0.6, animations: {
                        print("alpha")
                        self.errorLabel.alpha = 1.0
                    }) {completed in
                        print("blank")
                        if completed { self.errorLabel.alpha = 0.0 }
                    }
                }
                
                
            }
        }
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



extension SearchMovieViewController: UITextFieldDelegate {
    
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
    
}








