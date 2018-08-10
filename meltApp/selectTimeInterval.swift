//
//  selectTimeInterval.swift
//  meltApp
//
//  Created by Kode With Klossy on 8/10/18.
//  Copyright © 2018 Kode With Klossy. All rights reserved.
//

import UIKit

class selectTimeInterval: UIViewController {

    @IBOutlet weak var selectedTime: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectTimeInterval(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            let timeToSave = Photo(entity: Photo.entity(), insertInto: context)
            
            timeToSave.timeData = Double(selectedTime.text!)!
            
            
        }
        
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        
        navigationController?.popViewController(animated: true)
    }
    
    

}
