//
//  ComboController.swift
//  Foodmash
//
//  Created by Saravanabalagi R on 17/06/16.
//  Copyright © 2016 Meals on Wheels Technology LLP. All rights reserved.
//

import UIKit

class ComboController: UIViewController {

    var packagingCentreId: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(String(packagingCentreId)+" From Combo Controller")
        // Do any additional setup after loading the view.
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
