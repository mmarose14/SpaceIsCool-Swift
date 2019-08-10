//
//  APODViewModel.swift
//  SpaceIsCool
//
//  Created by Matt Marose on 8/10/19.
//  Copyright © 2019 Matt Marose. All rights reserved.
//

import Foundation

class APODViewModel {
    
    var apiClient: APIClient = APIClient()
    var apod: APOD?
    
    func getAPOD(completion: @escaping () -> Void) {
        apiClient.getAPOD { (response, error) in
            
            if let error = error {
                print(error)
                return
            }
            
            self.apod = response

            completion()
        }
    }

}
