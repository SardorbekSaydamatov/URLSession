//
//  ViewController.swift
//  imageURL
//
//  Created by Sardorbek Saydamatov on 17/06/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let imageURL = URL(string: "https://static.scientificamerican.com/sciam/cache/file/32665E6F-8D90-4567-9769D59E11DB7F26_source.jpg?w=1200")!
    var catImage = UIImageView()
    var viewModel: ImageViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        viewModel = ImageViewModel(imageURL: imageURL)
        
        viewModel.fetchImage { [weak self] image in
            guard let self = self else { return }
            
            if let image = image {
                self.catImage.image = image
            } else {
                print("Failed to fetch image from URL: \(self.imageURL)")
            }
        }
        setUpImage()
        setUpConstraint()
    }
    
    func setUpConstraint() {
        view.addSubview(catImage)
        let commonConstraints = 10
       
        catImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(commonConstraints)
            make.leading.equalToSuperview().offset(commonConstraints)
            make.trailing.equalToSuperview().offset(-commonConstraints)
            make.bottom.equalToSuperview().offset(-commonConstraints)
        }
    }
    
    func setUpImage() {
        catImage.clipsToBounds = true
        catImage.contentMode = .scaleAspectFit
    }
}


