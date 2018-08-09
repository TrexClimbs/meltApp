//
//  PlayProjectViewController.swift
//  meltApp
//
//  Created by Kode With Klossy on 8/8/18.
//  Copyright © 2018 Kode With Klossy. All rights reserved.
//

import UIKit

class PlayProjectViewController: UIViewController {
    
    @IBOutlet weak var playProjectImage: UIImageView!
    
    var photoIndex = 0
    
    var gameTimer: Timer!
    
    var photoArray : [Photo] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {

            if let coreDataPhotos = try? context.fetch(Photo.fetchRequest()) as? [Photo] {

                if let unwrappedPhotos = coreDataPhotos {
                    
//                    let cellPhotoImageData = unwrappedPhotos[photoIndex].imageData
                    
                    print(unwrappedPhotos)
                    
//                    let cellPhotoImage = UIImage(data: cellPhotoImageData!)
                    
//                    photoArray.append(UIImage(data: cellPhotoImageData!)!)
                    
                    photoArray = unwrappedPhotos
                    
                    gameTimer = Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(displayNextPhoto), userInfo: nil, repeats: true)

                }
            }
        }
    }
    
    @objc func displayNextPhoto() {
        
        if photoIndex < photoArray.count {
            
            let cellPhotoImageData = photoArray[photoIndex].imageData
            
            let cellPhotoImage = UIImage(data: cellPhotoImageData!)
            
            playProjectImage.image = cellPhotoImage
        
        }
        photoIndex += 1
        
        if photoIndex == photoArray.count {
            photoIndex = 0
        }
    }

}
