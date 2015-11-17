//
//  PhotoCollectionViewCell.swift
//  Photos
//
//  Created by Liam Leahy on 11/15/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageContained: UIImageView!
    
    func setImage(image: UIImage) {
        imageContained.image = image
    }
}
