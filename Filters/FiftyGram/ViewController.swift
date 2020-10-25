//
//  ViewController.swift
//  FiftyGram
//
//  Created by Ayan Reza on 8/29/20.
//  Copyright © 2020 Ayan Reza. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    let context = CIContext()
    var original: UIImage?
    @IBOutlet var imageView: UIImageView!
    @IBAction func choosePhoto() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .photoLibrary
            navigationController?.present(picker, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func applySepia() {
        if original == nil {
            return
        }
        let filter = CIFilter(name: "CISepiaTone")
        filter?.setValue(0.5, forKey: kCIInputIntensityKey)
        filter?.setValue(CIImage(image: original!), forKey: kCIInputImageKey)
        display(filter: filter!)
    }
    
    @IBAction func applyNoir() {
        if original == nil {
            return
               }
        let filter = CIFilter(name: "CIPhotoEffectNoir")
        filter?.setValue(CIImage(image: original!), forKey: kCIInputImageKey)
        let output = filter?.outputImage
        imageView.image = UIImage(cgImage: self.context.createCGImage(output!, from: output!.extent)!)
        display(filter: filter!)
    }
    
    @IBAction func applyVintage() {
        if original == nil {
                          return
                      }
                      let filter = CIFilter(name: "CIPhotoEffectProcess")
        filter?.setValue(CIImage(image: original!), forKey: kCIInputImageKey)
                      let output = filter?.outputImage
                      imageView.image = UIImage(cgImage: self.context.createCGImage(output!, from: output!.extent)!)
                      display(filter: filter!)
    }
    
   
    func display(filter: CIFilter) {
        filter.setValue(CIImage(image: original!), forKey: kCIInputImageKey)
                      let output = filter.outputImage
                      imageView.image = UIImage(cgImage: self.context.createCGImage(output!, from: output!.extent)!)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        navigationController?.dismiss(animated: true, completion: nil)
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = image
            original = image
        }
    }
    
    
}

