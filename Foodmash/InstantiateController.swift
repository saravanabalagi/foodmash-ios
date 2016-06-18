//
//  InstantiateController.swift
//  Foodmash
//
//  Created by Saravanabalagi R on 16/06/16.
//  Copyright © 2016 Meals on Wheels Technology LLP. All rights reserved.
//

import UIKit
import Alamofire

class InstantiateController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request(.POST,
            R.string.routes.api_root_path() +
            R.string.routes.instantiate(),
            parameters: JsonProvider.getAnonymousJson())
            .validate()
            .responseJSON { response in
                switch response.result {
                case .Success:
                    let controller = self.storyboard!.instantiateViewControllerWithIdentifier("LocationController")
                    self.presentViewController(controller, animated: true, completion: nil)
                case .Failure(let error):
                    print(error)
                }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
