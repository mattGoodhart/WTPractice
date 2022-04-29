//
//  CollectionViewCell.swift
//  WT Practice
//
//  Created by Matt Goodhart on 4/28/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "CollectionViewCell"
    
    @IBOutlet weak var employeeImageView: UIImageView!
    @IBOutlet weak var resultImage: UIImageView!
   // @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
}
