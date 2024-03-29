//
//  Order.swift
//  Foodmash
//
//  Created by Saravanabalagi R on 18/06/16.
//  Copyright © 2016 Meals on Wheels Technology LLP. All rights reserved.
//

import Foundation

class Order: Equatable {
    
    var combo: Combo!
    var quantity: Int!
    var note: String?
    
}

func == (left: Order, right: Order) -> Bool {
    if left.quantity != right.quantity { return false }
    if left.combo != right.combo { return false }
    return true
}
