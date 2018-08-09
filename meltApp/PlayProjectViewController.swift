//
//  PlayProjectViewController.swift
//  meltApp
//
//  Created by Kode With Klossy on 8/8/18.
//  Copyright © 2018 Kode With Klossy. All rights reserved.
//

import UIKit

class PlayProjectViewController: UIViewController {

    var photo : Photo?
    
    @IBOutlet weak var playProjectImage: UIImageView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            if let coreDataPhotos = try? context.fetch(Photo.fetchRequest()) as? [Photo] {
                
                
                if let unwrappedPhotos = coreDataPhotos {
                    
                    if let cellPhotoImageData = unwrappedPhotos[0].imageData {
                        
                        if let cellPhotoImage = UIImage(data: cellPhotoImageData) {
                            
                            playProjectImage.image = cellPhotoImage
                        }
                    }

                }
                
            }
        }
        
//        for cell in EditProjectTableViewController {
        
//        }
    }

}
