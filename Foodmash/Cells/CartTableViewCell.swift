//
//  CartTableViewCell.swift
//  Foodmash
//
//  Created by Saravanabalagi R on 19/06/16.
//  Copyright © 2016 Meals on Wheels Technology LLP. All rights reserved.
//

import UIKit

protocol CartDelegate {
    func plusTapped(cell: CartTableViewCell)
    func minusTapped(cell: CartTableViewCell)
}

class CartTableViewCell: UITableViewCell {

    @IBOutlet var name: UILabel!
    @IBOutlet var price: UILabel!
    @IBOutlet var contents: UILabel!
    @IBOutlet var quantity: UILabel!
    
    var order: Order!
    
    var delegate: CartDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func onPlusTapped(sender: UIButton) { delegate?.plusTapped(self) }
    @IBAction func onMinusTapped(sender: UIButton) { delegate?.minusTapped(self) }
}
