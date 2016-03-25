//
//  PhotoTakingHelper.swift
//  MyInstagram
//
//  Created by DE DPU on 3/25/2559 BE.
//  Copyright © 2559 mycompany. All rights reserved.
//

import UIKit

typealias PhotoTakingHelperCallback = UIImage? -> Void

class PhotoTakingHelper: NSObject {
    //1. Present action sheet --> UIAlertController
    //2. Present the camera or photo library --> UIImagePickerController
    //3. Return the image --> Callback function ตอบสนองต่อการทำงาน
    
    weak var viewController: UIViewController!//weak ตัวแปรUI
    var callback: PhotoTakingHelperCallback
    var imagePickerController: UIImagePickerController?
    
    init(viewController: UIViewController, callback: PhotoTakingHelperCallback){
        self.viewController = viewController
        self.callback = callback
        
        super.init()
        showPhotoSourceSelection()
    }
    
    func showImagePickerController(sourceType: UIImagePickerControllerSourceType){
        imagePickerController = UIImagePickerController()//ควบคุมแหล่งที่มาของภาพ
        imagePickerController!.sourceType = sourceType
        imagePickerController?.delegate = self
        self.viewController.presentViewController(imagePickerController!, animated: true, completion: nil)
    }
    
    func showPhotoSourceSelection(){
        //ให้ user สามารถเลือกได้ระหว่าง photo library
        let alertController = UIAlertController(title: nil, message: "Where do you want to get your picture from?", preferredStyle: .ActionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        alertController.addAction(cancelAction)
        
        let photoLibaryAction = UIAlertAction(title: "Photo from Library", style: .Default){ (action) in
            self.showImagePickerController(.PhotoLibrary)
        }
        
        alertController.addAction(photoLibaryAction)
        
        //only show camera option if rear camera is available
        if(UIImagePickerController.isCameraDeviceAvailable(.Rear)){
            let cameraAction = UIAlertAction(title: "Photo from Camera", style: .Default){
                (action) in
                
                self.showImagePickerController(.Camera)
            }
            alertController.addAction(cameraAction)
        }//จบการสร้าง action sheet
        
        viewController.presentViewController(alertController, animated: true, completion: nil)
    }
}

extension PhotoTakingHelper : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        viewController.dismissViewControllerAnimated(false, completion: nil)
        callback(image)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        viewController.dismissViewControllerAnimated(true, completion: nil)
    }
}



