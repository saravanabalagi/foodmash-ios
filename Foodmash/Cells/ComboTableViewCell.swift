//
//  ComboTableViewCell.swift
//  Foodmash
//
//  Created by Saravanabalagi R on 17/06/16.
//  Copyright © 2016 Meals on Wheels Technology LLP. All rights reserved.
//

import UIKit

protocol ComboDelegate {
    func minusTapped(cell: ComboTableViewCell)
    func plusTapped(cell: ComboTableViewCell)
    func pictureTapped(cell: ComboTableViewCell)
}

class ComboTableViewCell: UITableViewCell {

    //MARK: Properties
    @IBOutlet var quantity: UILabel!
    @IBOutlet var name: UILabel!
    @IBOutlet var picture: UIImageView!
    @IBOutlet var price: UILabel!
    @IBOutlet var minusButton: UIButton!
    
    var delegate: ComboDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ComboTableViewCell.onPictureTapped))
        picture.addGestureRecognizer(tapGesture)
        tapGesture.delegate = self
        self.delegate?.pictureTapped(self)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    //MARK: Actions
    func onPictureTapped(sender: UITapGestureRecognizer) { delegate?.pictureTapped(self) }
    @IBAction func onMinusTapped(sender: AnyObject) { delegate?.minusTapped(self) }
    @IBAction func onPlusTapped(sender: AnyObject) { delegate?.plusTapped(self)  }
    
}
