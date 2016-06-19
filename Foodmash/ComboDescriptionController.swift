//
//  ComboDescriptionController.swift
//  Foodmash
//
//  Created by Saravanabalagi R on 18/06/16.
//  Copyright © 2016 Meals on Wheels Technology LLP. All rights reserved.
//

import UIKit
import PageMenu

class ComboDescriptionController: UIViewController, CAPSPageMenuDelegate {

    var comboId: Int!
    var combo: Combo!
    var pageMenu: CAPSPageMenu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        combo = Cache.combos.filter({$0.id == comboId}).first
        var controllerArray: [UIViewController] = []
        let titleArray: [String] = combo.comboOptions.map({$0.name})
        let parameters: [CAPSPageMenuOption] = [
            .ScrollMenuBackgroundColor(UIColor( white: 0.93, alpha: 1)),
            .SelectionIndicatorColor(UIColor(red: 0.9, green: 0.0, blue: 0.0, alpha: 1)),
            .SelectedMenuItemLabelColor(UIColor(white: 0.05, alpha: 1)),
            .UnselectedMenuItemLabelColor(UIColor(white: 0.5, alpha: 1))
        ]
        for index in 0...titleArray.count-1 {
            let comboOptionController = self.storyboard!.instantiateViewControllerWithIdentifier("ComboOptionController") as? ComboOptionController
            comboOptionController?.comboOption = combo.comboOptions[index]
            comboOptionController?.title = titleArray[index]
            controllerArray.append(comboOptionController!)
        }
        
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 65.0, self.view.frame.width, self.view.frame.height - (65+90)), pageMenuOptions: parameters)
        pageMenu?.delegate = self
        self.view.addSubview(pageMenu!.view)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func addToCart(sender: UIButton) {
        Cart.addToCart(combo)
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
