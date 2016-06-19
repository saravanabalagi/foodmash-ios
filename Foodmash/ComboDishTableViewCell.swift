//
//  ComboDishTableViewCell.swift
//  Foodmash
//
//  Created by Saravanabalagi R on 18/06/16.
//  Copyright © 2016 Meals on Wheels Technology LLP. All rights reserved.
//

import UIKit

protocol ComboDishDelegate {
    func minusTapped(cell: ComboDishTableViewCell)
    func plusTapped(cell: ComboDishTableViewCell)
}

class ComboDishTableViewCell: UITableViewCell {
    
    var delegate: ComboDishDelegate?
    @IBOutlet var minusButton: UIButton!
    @IBOutlet var quantity: UILabel!
    @IBOutlet var price: UILabel!
    @IBOutlet var name: UILabel!
    @IBOutlet var picture: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    @IBAction func onMinusTapped(sender: UIButton) { delegate?.minusTapped(self) }
    @IBAction func onPlusTapped(sender: UIButton) { delegate?.plusTapped(self) }
}
