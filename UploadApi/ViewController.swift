//
//  ViewController.swift
//  UploadApi
//
//  Created by Nicolas Besnard on 15/02/2015.
//  Copyright (c) 2015 Nicolas Besnard. All rights reserved.
//

import UIKit
import Alamofire
import AFNetworking

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func clickOnButton(sender: AnyObject) {
        let fileURL = NSBundle.mainBundle().URLForResource("ChiracBoard", withExtension: "png")
        
        let manager = AFHTTPRequestOperationManager()
        manager.POST("http://localhost:3000/users/1/photo",
            parameters: ["type": 1],
            constructingBodyWithBlock: { (formData: AFMultipartFormData!) -> Void in

                formData.appendPartWithFileURL(fileURL!, name: "data", error: nil)
                    return
            }, success: { (t: AFHTTPRequestOperation!, o: AnyObject!) -> Void in
                
            }, failure: { (t: AFHTTPRequestOperation!, o: NSError!) -> Void in

        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

