//
//  NewProject.swift
//  meltApp
//
//  Created by Kode With Klossy on 8/9/18.
//  Copyright © 2018 Kode With Klossy. All rights reserved.
//

import UIKit

class NewProject: UIViewController {

    var project : [Any] = []
    
    @IBOutlet weak var projectName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveProject(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let projectToSave = Project(entity: Project.entity(), insertInto: context)
            projectToSave.projectData = projectName.text
            
            (UIApplication.shared.delegate as? AppDelegate )
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
