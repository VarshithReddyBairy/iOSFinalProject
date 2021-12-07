//
//  Shows.swift
//  ShowSearchApp
//
//  Created by student on 12/5/21.
//

import Foundation
class Shows{
    struct Returned : Codable{
        var show : Show
    }
    
    
    var urlString = "https://api.tvmaze.com/search/shows?q="
    var showsArray : [Returned] = []
    
    func getData(completed: @escaping () -> ()){
        let url = URL(string: urlString)!
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print("error \(error.localizedDescription)" )
            }
            
            do{
                self.showsArray = try JSONDecoder().decode([Returned].self, from: data!)
            }catch{
                print("JSON ERROR \(error.localizedDescription)")
            }
            
        }
        task.resume()
    }
}
