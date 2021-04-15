//
//  NetworkManager.swift
//  Finance News
//
//  Created by youngjun kim on 2021/04/15.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=37cd5eb6fa9c4dcda949e1a6a20ac077") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let result = try decoder.decode(PostData.self, from: safeData)
                            
                            DispatchQueue.main.async {
                                self.posts = result.articles
                            }
                            
                        } catch {
                            print(error)
                        }
                        
                    }
                }
            }
            task.resume()
        }
    }
    
}
