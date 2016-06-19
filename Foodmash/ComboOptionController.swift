//
//  ComboOptionController.swift
//  Foodmash
//
//  Created by Saravanabalagi R on 18/06/16.
//  Copyright © 2016 Meals on Wheels Technology LLP. All rights reserved.
//

import UIKit

class ComboOptionController: UIViewController, UITableViewDataSource, UITableViewDelegate, ComboDishDelegate {

    var comboOption: ComboOption!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Table Methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int { return 1 }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return comboOption.comboOptionDishes.count }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: ComboDishTableViewCell = tableView.dequeueReusableCellWithIdentifier("ComboDishTableViewCell", forIndexPath: indexPath) as! ComboDishTableViewCell
        let comboOptionDish = comboOption.comboOptionDishes[indexPath.row]
        cell.tag = comboOptionDish.id
        cell.name.text = comboOptionDish.dish.name
        cell.picture.kf_setImageWithURL(NSURL(string: comboOptionDish.dish.picture)!)
        cell.price.text = String(comboOptionDish.dish.price)
        cell.quantity.text = String(0)
        cell.delegate = self
        
        return cell
        
    }
    
    //MARK: Cell Actions
    func minusTapped(cell: ComboDishTableViewCell) {
        let comboDish = comboOption.comboOptionDishes.filter({$0.id == cell.tag}).first!
        if comboDish.quantity > 0 {
            if(comboDish.quantity == 1) {
                comboOption.selectedComboOptionDishes.remove(comboDish)
                cell.quantity.hidden = true
                cell.minusButton.hidden = true
            }
            comboDish.quantity -= 1
            cell.quantity.text = String(comboDish.quantity)
        }
    }
    
    func plusTapped(cell: ComboDishTableViewCell) {
        let comboDish = comboOption.comboOptionDishes.filter({$0.id == cell.tag}).first!
        if comboDish.quantity == 0 {
            comboOption.selectedComboOptionDishes.insert(comboDish)
            cell.quantity.hidden = false
            cell.minusButton.hidden = false
        }
        comboDish.quantity += 1
        cell.quantity.text = String(comboDish.quantity)
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
