//
//  ComboOptionDish.swift
//  Foodmash
//
//  Created by Saravanabalagi R on 16/06/16.
//  Copyright © 2016 Meals on Wheels Technology LLP. All rights reserved.
//

import Foundation
import ObjectMapper

class ComboOptionDish: Mappable {
    
    var id: Int!
    var priority: Int!
    var minCount: Int!
    var quantity: Int = 0
    var dish: Dish!
    
    required init?(_ map: Map) {}

    func mapping(map: Map) {	
		id <- map["id"]	
		priority <- map["priority"]	
		minCount <- map["min_count"]	
		quantity <- map["quantity"]
		dish <- map["dish"]   	 
    }
    
}