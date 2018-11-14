//
//  ViewController.swift
//  PhotoShare
//
//  Created by Md. Shahadet Hossain on 2018-11-13.
//  Copyright © 2018 Md. Shahadet Hossain. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView1: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func takeAPhoto(_ sender: UIButton) {
        
        let imagepickerController = UIImagePickerController()
        imagepickerController.delegate = self
        imagepickerController.sourceType = .camera
        if !UIImagePickerController.isSourceTypeAvailable(.camera){
            let alertController = UIAlertController.init(title: nil, message: "Device has no camera.", preferredStyle: .alert)
            let okAction = UIAlertAction.init(title: "Alright", style: .default, handler: {(alert: UIAlertAction!) in })
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            
            imagepickerController.sourceType = .photoLibrary
        }
        else{
            self.present(imagepickerController, animated: true, completion: nil)
        }
    }
    
    @IBAction func uploadPhoto(_ sender: UIButton) {
        let imagepickerController = UIImagePickerController()
        imagepickerController.delegate = self
        imagepickerController.sourceType = .photoLibrary
        
        self.present(imagepickerController, animated: true, completion: nil)
        
    }
    @IBAction func uploadToFirebase(_ sender: UIButton) {
        let store = Storage.storage()
        let storeRef = store.reference()
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imageView1.image=image
        picker.dismiss(animated: true, completion: nil)
    }
    
}

