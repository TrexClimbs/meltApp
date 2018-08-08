//
//  EditProjectTableViewController.swift
//  meltApp
//
//  Created by Kode With Klossy on 8/8/18.
//  Copyright © 2018 Kode With Klossy. All rights reserved.
//

import UIKit

class EditProjectTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var photo : [Photo] = []
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            print("hellooooo melt")
        }
        
        imagePicker.delegate = self
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @IBAction func accessProjectCamera(_ sender: Any) {
        imagePicker.sourceType = .camera
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func accessProjectLibrary(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            let photoToSave = Photo(entity: Photo.entity(), insertInto: context)
            
            if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
                
                if let userImage = selectedImage as? UIImage {
                    
                    if let userImageData = UIImagePNGRepresentation(userImage) {
                        photoToSave.imageData = userImageData
                        
                    }
                }
                
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                
            }
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func getPhotos() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            if let coreDataPhotos = try? context.fetch(Photo.fetchRequest()) as? [Photo] {
                
                if let unwrappedPhotos = coreDataPhotos {
                    photo = unwrappedPhotos
                    tableView.reloadData()
                    
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getPhotos()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        let cellPhoto = photo[indexPath.row]
        
        print("first")
        
        if let cellPhotoImageData = cellPhoto.imageData {
            
            print("first ifff")
            
            if let cellPhotoImage = UIImage(data: cellPhotoImageData) {
                cell.imageView?.image = cellPhotoImage
                print("second ifff")
            }
        }
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return photo.count
    }

    

    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
