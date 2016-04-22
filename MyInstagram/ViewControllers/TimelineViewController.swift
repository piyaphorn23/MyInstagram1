//
//  TimelineViewController.swift
//  MyInstagram
//
//  Created by DE DPU on 3/25/2559 BE.
//  Copyright © 2559 mycompany. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var photoTakingHelper: PhotoTakingHelper?
    var kumulos : Kumulos?
    var postListData : NSMutableArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarController?.delegate = self
        
        kumulos = Kumulos()
        postListData = NSMutableArray()
        kumulos?.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        kumulos?.getPostWithPostOwner(1)
    }
    
    func takePhoto(photoViewController : PhotoViewController){
        photoTakingHelper = PhotoTakingHelper(viewController: self.tabBarController!){
            (image:UIImage?) in
            
            if let image = image{
                //let objKumulos = Kumulos()
                //let imageNSData = UIImageJPEGRepresentation(image, 1)
                //objKumulos.uploadPhotoWithImageData(imageNSData, andPostData: 1)
                self.tabBarController?.selectedViewController = photoViewController
                photoViewController.imgCurrentPhoto.image = image
                photoViewController.txtDescription.text = nil
            }
        }
        
        /*PhotoTakingHelper(viewController: self.tabBarController!, callback: {(image:UIImage?) in
        
        }) ส่งผ่านฟังก์ชัน*/
    }
}

//MARK: Table View Data Source
extension TimelineViewController : UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postListData?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("PostCell") as! PostTableViewCell
        
        if let list = postListData?.objectAtIndex(indexPath.row){
            let listDictionary = list as! NSDictionary
            
            cell.txtDescription.text = (postListData?.objectAtIndex(indexPath.row) as! NSDictionary).valueForKey("description") as! String
            
            let photos = listDictionary.valueForKey("photos") as! NSArray
            let firstPhoto = photos.firstObject as! NSDictionary
            let imageData = firstPhoto.valueForKey("imageData") as! NSData
            
            cell.postImage.image = UIImage(data: imageData)
        }
        return cell
    }
}

//MARK: Kumulos Delegate
extension TimelineViewController : KumulosDelegate{
    func kumulosAPI(kumulos: Kumulos!, apiOperation operation: KSAPIOperation!, getPostDidCompleteWithResult theResults: [AnyObject]!) {
        
        postListData?.removeAllObjects()
        postListData?.addObjectsFromArray(theResults)
        self.tableView.reloadData()
        
    }
}

//MARK: Tab Bar Delegate
    
extension TimelineViewController: UITabBarControllerDelegate{
        
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewContrller: UIViewController) -> Bool{
        
        if(viewContrller is PhotoViewController){
            takePhoto(viewContrller as! PhotoViewController)
            return false
        }
        else {
            return true
        }
    }
}


