//
//  ViewModel.swift
//  imageURL
//
//  Created by Sardorbek Saydamatov on 17/06/24.
//

import Foundation
import UIKit

class ImageViewModel {
    let imageURL: URL
    
    init(imageURL: URL) {
        self.imageURL = imageURL
    }
    
    func fetchImage(completion: @escaping (UIImage?) -> Void) {
        let task = URLSession.shared.dataTask(with: imageURL) { data, response, error in
            if let error = error {
                print("Error fetching image: \(error.localizedDescription)")
                completion(nil)
                return
            }
                        
            guard let data = data else {
                print("No data received")
                completion(nil)
                return
            }
                        
            if let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    completion(image)
                }
            } else {
                print("Unable to create image from data")
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
        task.resume()
    }
}
