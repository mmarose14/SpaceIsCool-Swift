//
//  APIClient.swift
//  SpaceIsCool
//
//  Created by Matt Marose on 8/9/19.
//  Copyright © 2019 Matt Marose. All rights reserved.
//

import Foundation

class APIClient {
    private let session = URLSession.shared
    
    func getAPOD(completion: @escaping (APOD?, Error?) -> Void) {
    
        let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=\(Constants.apiKey)")!
        
        session.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                completion(nil, error)
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode)
                else {
                    print("Error!!!")
                return
            }
            
            let decoder = JSONDecoder()
            if let data = data {
                do {
                    let apod = try decoder.decode(APOD.self, from:data)
                    print(apod)
                    completion(apod, nil)
                } catch {
                    completion(nil, nil)
                }
                
            }
            
            
        }.resume()
        
    }
}
