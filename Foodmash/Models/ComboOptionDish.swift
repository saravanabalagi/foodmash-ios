//
//  ComboOptionDish.swift
//  Foodmash
//
//  Created by Saravanabalagi R on 16/06/16.
//  Copyright © 2016 Meals on Wheels Technology LLP. All rights reserved.
//

import Foundation
import ObjectMapper

class ComboOptionDish: Mappable, Equatable, Hashable, CustomStringConvertible {
    
    var id: Int!
    var priority: Int!
    var minCount: Int!
    var quantity: Int = 0
    var dish: Dish!
    var description: String {
        return String(quantity) + "x " + dish.name + "(" + String(id) + ")"
    }
    
    required init?(_ map: Map) {}
    init(comboOptionDish: ComboOptionDish) {
        self.id = comboOptionDish.id        
        self.priority = comboOptionDish.priority
        self.minCount = comboOptionDish.minCount
        self.quantity = comboOptionDish.quantity
        self.dish = comboOptionDish.dish
    }

    func mapping(map: Map) {	
		id <- map["id"]	
		priority <- map["priority"]	
		minCount <- map["min_count"]	
		quantity <- map["quantity"]
		dish <- map["dish"]   	 
    }
    
    var hashValue: Int {
        return self.id * self.quantity
    }
}

func == (left: ComboOptionDish, right: ComboOptionDish) -> Bool {
    print("Comparing comboOptionDish")
    print(String(left) + " vs " + String(right))
    if left.id != right.id { print("IDs not equal\n"); return false }
    if left.quantity != right.quantity { print("Quantity not equal\n"); return false }
    print("Both are equal")
    print()
    return true
}
