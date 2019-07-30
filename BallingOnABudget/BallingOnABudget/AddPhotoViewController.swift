//
//  AddPhotoViewController.swift
//  BallingOnABudget
//
//  Created by Camille on 7/29/19.
//  Copyright © 2019 KWK. All rights reserved.
//

import UIKit

class AddPhotoViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
var imagePicker = UIImagePickerController()

    @IBOutlet weak var lilioutlet: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
    
   

    @IBAction func takeSelfieTapped(_ sender: Any){
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func accessLibrary(_ sender: Any){
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    @IBOutlet weak var anything: UIImageView!
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            anything.image = selectedImage
            imagePicker.dismiss(animated: true, completion: nil)
        }
       
}
    @IBAction func savethis(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let photoToSave = Photos(entity: Photos.entity(), insertInto: context)
            photoToSave.captions = lilioutlet.text
            if let userImage = anything.image {
                
               if let userImageData = userImage.pngData() {
             photoToSave.imageData = userImageData
                }
            }
        
        
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            navigationController?.popViewController(animated: true)
        }
            
        }
           
            
        }
            

  

    
    

    // Do any additional setup after loading the view.

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */




