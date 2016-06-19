//
//  ComboController.swift
//  Foodmash
//
//  Created by Saravanabalagi R on 17/06/16.
//  Copyright © 2016 Meals on Wheels Technology LLP. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import Kingfisher

class ComboController: UIViewController, UITableViewDelegate, UITableViewDataSource, ComboDelegate {

    var packagingCentreId: Int!
    @IBOutlet var comboTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem?.title = Cache.selectedArea?.name
        Alamofire.request(.POST,
            R.string.routes.api_root_path() +
                R.string.routes.get_combos(),
            parameters: JsonProvider.getAnonymousJson())
            .validate()
            .responseJSON { response in
                switch response.result {
                case .Success:
                    if let value = response.result.value {
                        Cache.combos = Mapper<Combo>().mapArray(value["data"]!!["combos"])!
                        dispatch_async(dispatch_get_main_queue(), {
                            self.comboTableView.reloadData()
                            return
                        })
                    }
                case .Failure(let error):
                    print(error)
                }
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Table Methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int { return 1 }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return Cache.combos.count }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: ComboTableViewCell = tableView.dequeueReusableCellWithIdentifier("ComboTableViewCell", forIndexPath: indexPath) as! ComboTableViewCell
        let combo = Cache.combos[indexPath.row]
        cell.tag = combo.id
        cell.name.text = combo.name
        cell.picture.kf_setImageWithURL(NSURL(string: combo.picture)!)
        cell.price.text = String(combo.price)
        cell.quantity.text = String(0)
        cell.delegate = self

        return cell
        
    }
    
    //MARK: Cell Actions
    func pictureTapped(cell: ComboTableViewCell) {
        let comboDescriptionController = self.storyboard!.instantiateViewControllerWithIdentifier("ComboDescriptionController") as? ComboDescriptionController
        comboDescriptionController!.comboId = cell.tag
        self.navigationController!.pushViewController(comboDescriptionController!, animated: true)
    }
    
    func minusTapped(cell: ComboTableViewCell) {
        if(Int(cell.quantity.text!) > 0) {
            Cart.removeFromCart(cell.tag)
            cell.quantity.text = String(Int(cell.quantity.text!)! - 1)
            if(Int(cell.quantity.text!)! == 0) {
                cell.quantity.hidden = true
                cell.minusButton.hidden = true
            }
        }
    }
    
    func plusTapped(cell: ComboTableViewCell) {
        Cart.addToCart(cell.tag)
        cell.quantity.text = String(Int(cell.quantity.text!)! + 1)
        if(Int(cell.quantity.text!) > 0) {
            cell.quantity.hidden = false
            cell.minusButton.hidden = false
        }
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
