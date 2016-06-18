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
    var combos: [Combo] = []
    @IBOutlet var comboTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request(.POST,
            R.string.routes.api_root_path() +
                R.string.routes.get_combos(),
            parameters: JsonProvider.getAnonymousJson())
            .validate()
            .responseJSON { response in
                switch response.result {
                case .Success:
                    if let value = response.result.value {
                        self.combos = Mapper<Combo>().mapArray(value["data"]!!["combos"])!
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
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return combos.count }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: ComboTableViewCell = tableView.dequeueReusableCellWithIdentifier("ComboTableViewCell", forIndexPath: indexPath) as! ComboTableViewCell
        let combo = self.combos[indexPath.row]
        cell.name.text = combo.name
        cell.picture.kf_setImageWithURL(NSURL(string: combo.picture)!)
        cell.price.text = String(combo.price)
        cell.delegate = self

        return cell
        
    }
    
    //MARK: Cell Actions
    func pictureTapped(cell: ComboTableViewCell) {
        print("Picture is tapped")
    }
    
    func minusTapped(cell: ComboTableViewCell) {
        print("Minus is tapped")
    }
    
    func plusTapped(cell: ComboTableViewCell) {
        print("Plus is tapped")
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
