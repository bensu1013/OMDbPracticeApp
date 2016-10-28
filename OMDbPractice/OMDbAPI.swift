//
//  OMDbAPI.swift
//  OMDbPractice
//
//  Created by Benjamin Su on 10/26/16.
//  Copyright © 2016 Benjamin Su. All rights reserved.
//

import Foundation
import UIKit

class OMDbAPI {
    
    static func getOMDbInfo(urlString: String, completion: @escaping ([String : String]) -> () ) {
        
        let urlString = urlString
        
        let url = URL(string: urlString)
        
        if let url = url {
            
            let session = URLSession.shared
            
            let dataTask = session.dataTask(with: url, completionHandler: { (data, response, error) in
                
                if error == nil {
                    
                    if let data = data {
                        
                        do {
                            let responseJSON = try JSONSerialization.jsonObject(with: data, options: []) as! [String : String]
                            
                            completion(responseJSON)
                            
                        } catch {
                            print( "What is going on?" )
                        }
                    } else {
                        print("Bad data")
                    }
                    
                } else {
                    print(error)
                }
            })
            dataTask.resume()
        }
    }
    
    
    static func getMovieImage(posterURL: String, completion: @escaping (UIImage?) -> () ) {

        let url = URL(string: posterURL)
        
        if let url = url {
        
            let session = URLSession.shared
            
            let dataTask = session.dataTask(with: url, completionHandler: { (data, response, error) in
         
                if error == nil {
                    
                    if let data = data {
                       
                        let image = UIImage(data: data)
                        
                        if let image = image {
                            completion(image)
                        }
                    }
                } else {
                    print("Error occured with Poster")
                }
            })
            dataTask.resume()
        }
    }
    
    
    
    
    
    
    
    
    
    
}






