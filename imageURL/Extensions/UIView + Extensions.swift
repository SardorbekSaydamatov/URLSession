//
//  UIView + Extensions.swift
//  imageURL
//
//  Created by Sardorbek Saydamatov on 17/06/24.
//

import Foundation
import UIKit

extension UIView {
    func addSubview(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}
