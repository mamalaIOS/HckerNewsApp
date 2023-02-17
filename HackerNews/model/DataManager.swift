//
//  DataManager.swift
//  HackerNews
//
//  Created by Amel Sbaihi on 11/13/22.
//

import Foundation
class DataManager : ObservableObject

{
    @Published var posts = [Post]()
    func fetchData () {
        
        guard let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") else {return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if error != nil {
                print("there is an error")
            }
                
                if let safeData = data
                
                {
                   let decoder = JSONDecoder()
                    do {
                     let decodedData =    try decoder.decode(Results.self, from: safeData)
                        self.posts = decodedData.hits
                        
                    }
                    
                    catch {
                        
                    }
                }
                
            
            
            
        }
        task.resume()
        
    }
}
