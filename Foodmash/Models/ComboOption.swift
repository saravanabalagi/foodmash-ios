//
//  ComboOption.swift
//  Foodmash
//
//  Created by Saravanabalagi R on 16/06/16.
//  Copyright © 2016 Meals on Wheels Technology LLP. All rights reserved.
//

import Foundation
import ObjectMapper

class ComboOption: Mappable {
    
    var id: Int!
    var priority: Int!
    var minCount: Int!
    var name: String!
    var description: String?
    var selectedComboOptionDishes: [ComboOptionDish] = []
    var comboOptionDishes: [ComboOptionDish] = []
    
    required init?(_ map: Map) {}

    func mapping(map: Map) {
		id <- map["id"]
		priority <- map["priority"]
		minCount <- map["min_count"]
		name <- map["name"]
		description <- map["description"]
		comboOptionDishes <- map["combo_option_dishes"]    
    }
    
}
