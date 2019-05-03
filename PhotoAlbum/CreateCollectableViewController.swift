//
//  CreateCollectableViewController.swift
//  PhotoAlbum
//
//  Created by apple on 5/3/19.
//  Copyright © 2019 shivaapple. All rights reserved.
//

import UIKit

class CreateCollectableViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    
    private var photoPickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoPickerController.delegate = self
    }
    
    
    @IBAction func addFromFolder(_ sender: UIBarButtonItem) {
        photoPickerController.sourceType = .photoLibrary
        present(photoPickerController, animated: true, completion: nil)
        
        
    }
    
    @IBAction func addFromCamera(_ sender: UIBarButtonItem) {
        photoPickerController.sourceType = .camera
        present(photoPickerController, animated: true, completion: nil)
    }
    
    @IBAction func AddImage(_ sender: UIButton) {
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            imageView.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
}
