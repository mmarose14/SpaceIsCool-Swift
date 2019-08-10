//
//  APODViewController.swift
//  SpaceIsCool
//
//  Created by Matt Marose on 8/9/19.
//  Copyright © 2019 Matt Marose. All rights reserved.
//

import UIKit

class APODViewController: UIViewController {
    @IBOutlet var apodImageView: UIImageView!
    @IBOutlet var apodDescription: UILabel!
    
    let apodViewModel = APODViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        apodViewModel.getAPOD {
            DispatchQueue.main.async {
                self.loadData()
            }
            
            self.getPhoto()
        }
        
    }
    
    func loadData() {
        apodDescription.text = apodViewModel.apod?.explanation
    }
    
    func getPhoto() {
        self.apodImageView.download(urlString: (apodViewModel.apod?.hdurl)!)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIImageView {
    public func download(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }
        }
    }
}
