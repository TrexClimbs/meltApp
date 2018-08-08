//
//  EnlargedImage.swift
//  meltApp
//
//  Created by Kode With Klossy on 8/8/18.
//  Copyright © 2018 Kode With Klossy. All rights reserved.
//

import UIKit

class EnlargedImage: UIViewController {

    var photo : Photo?
    
    @IBOutlet weak var enlargedImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let realPhoto = photo {
            
            if let cellPhotoImageData = realPhoto.imageData {
                
                if let cellPhotoImage = UIImage(data: cellPhotoImageData) {
                    
                    let fixedImage = ImageUtilities.fixImageOrientation(imageSource: cellPhotoImage)
                    
                    enlargedImage.image = fixedImage
                    
                }
            }
        }
    }
}
