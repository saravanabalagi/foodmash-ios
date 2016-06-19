//
//  CartController.swift
//  Foodmash
//
//  Created by Saravanabalagi R on 19/06/16.
//  Copyright © 2016 Meals on Wheels Technology LLP. All rights reserved.
//

import UIKit

class CartController: UIViewController, UITableViewDataSource, UITableViewDelegate, CartDelegate {

    
    @IBOutlet var cartTableView: UITableView!
    
    override func viewWillAppear(animated: Bool) {
        self.cartTableView.reloadData()
    }
    
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
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return Cart.orders.count }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat { return UITableViewAutomaticDimension }
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat { return UITableViewAutomaticDimension }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CartTableViewCell", forIndexPath: indexPath) as! CartTableViewCell
        let order = Cart.orders[indexPath.row]
        cell.name.text = order.combo.name
        cell.price.text = String(order.combo.price * Float(order.quantity))
        cell.quantity.text = String(order.quantity)
        cell.contents.text = order.combo.contents
        cell.order = order
        cell.delegate = self
        
        return cell
        
    }
    
    //MARK: Cell Actions
    func minusTapped(cell: CartTableViewCell) {
        if(cell.order.quantity >= 0) {
            print("Quantity: "+String(cell.order.quantity))
            Cart.removeFromCart(cell.order)
            if(cell.order.quantity == 0) { self.cartTableView.reloadData() }
            cell.quantity.text = String(cell.order.quantity)
            cell.price.text = String(cell.order.combo.price * Float(cell.order.quantity))
        }
    }
    
    func plusTapped(cell: CartTableViewCell) {
        Cart.addToCart(cell.order.combo)
        cell.quantity.text = String(cell.order.quantity)
        cell.price.text = String(cell.order.combo.price * Float(cell.order.quantity))
    }

    @IBAction func onClearTapped(sender: UIBarButtonItem) {
        Cart.orders = []
        cartTableView.reloadData()
    }

    @IBAction func onProceedTapped(sender: UIButton) {
        if Cache.isSignedIn {
            let addressController = self.storyboard!.instantiateViewControllerWithIdentifier("AddressController")
            self.presentViewController(addressController, animated: true, completion: nil)
        } else {
            let sessionController = self.storyboard!.instantiateViewControllerWithIdentifier("SessionController")
            self.presentViewController(sessionController, animated: true, completion: nil)
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
