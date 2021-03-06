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
    
    @IBOutlet weak var navBarTitle: UINavigationItem!
    var photoIndex = 0
    
    var gameTimer: Timer!
    
    var timeToUse = 0.25
    
    var photoArray : [Photo] = []
    
    func getPhotos() {
    
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
    
            if let coreDataPhotos = try? context.fetch(Photo.fetchRequest()) as? [Photo] {
    
                if let unwrappedPhotos = coreDataPhotos {
                    photoArray = unwrappedPhotos
    }
    
    }
    }
    
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        getPhotos()
        
        let selectedTime = photoArray[photoArray.count - 1]
        
        timeToUse = selectedTime.timeData
        
        navBarTitle.title = "Welcome!"

        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {

            if let coreDataPhotos = try? context.fetch(Photo.fetchRequest()) as? [Photo] {

                if let unwrappedPhotos = coreDataPhotos {
                    
//                    let cellPhotoImageData = unwrappedPhotos[photoIndex].imageData
                    
                    print(unwrappedPhotos)
                    
//                    let cellPhotoImage = UIImage(data: cellPhotoImageData!)
                    
//                    photoArray.append(UIImage(data: cellPhotoImageData!)!)
                    
                    photoArray = unwrappedPhotos
                    
                    gameTimer = Timer.scheduledTimer(timeInterval: timeToUse, target: self, selector: #selector(displayNextPhoto), userInfo: nil, repeats: true)

                }
            }
        }
    }
    
    @IBAction func stopAnimation(_ sender: Any) {
        gameTimer.invalidate()
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
