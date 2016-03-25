//
//  TimelineViewController.swift
//  MyInstagram
//
//  Created by DE DPU on 3/25/2559 BE.
//  Copyright © 2559 mycompany. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {

    var photoTakingHelper: PhotoTakingHelper?
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarController?.delegate = self
    }
    
    func takePhoto(){
        photoTakingHelper = PhotoTakingHelper(viewController: self.tabBarController!){
            (image:UIImage?) in
            
            if let image = image{
                let objKumulos = Kumulos()
                let imageNSData = UIImageJPEGRepresentation(image, 1)
                objKumulos.uploadPhotoWithImageData(imageNSData, andPostData: 1)
            }
        }
        
        /*PhotoTakingHelper(viewController: self.tabBarController!, callback: {(image:UIImage?) in
        
        }) ส่งผ่านฟังก์ชัน*/
    }
}
    //MARK: Tab Bar Delegate
    
extension TimelineViewController: UITabBarControllerDelegate{
        
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewContrller: UIViewController) -> Bool{
        
        if(viewContrller is PhotoViewController){
            takePhoto()
            return false
        }
        else {
            return true
        }
    }
}


