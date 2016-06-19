//
//  ComboOption.swift
//  Foodmash
//
//  Created by Saravanabalagi R on 16/06/16.
//  Copyright © 2016 Meals on Wheels Technology LLP. All rights reserved.
//

import Foundation
import ObjectMapper

class ComboOption: Mappable, Equatable {
    
    var id: Int!
    var priority: Int!
    var minCount: Int!
    var name: String!
    var description: String?
    var selectedComboOptionDishes: Set<ComboOptionDish> = Set()
    var comboOptionDishes: [ComboOptionDish] = []
    
    required init?(_ map: Map) {}
    init(comboOption: ComboOption) {
        self.id = comboOption.id        
        self.priority = comboOption.priority
        self.minCount = comboOption.minCount
        self.name = comboOption.name
        self.description = comboOption.description
        for comboOptionDish in comboOption.selectedComboOptionDishes {
            self.selectedComboOptionDishes.insert(ComboOptionDish(comboOptionDish: comboOptionDish))
        }
        for comboOptionDish in comboOption.comboOptionDishes {
            self.comboOptionDishes.append(ComboOptionDish(comboOptionDish: comboOptionDish))
        }
    }

    func mapping(map: Map) {
		id <- map["id"]
		priority <- map["priority"]
		minCount <- map["min_count"]
		name <- map["name"]
		description <- map["description"]
		comboOptionDishes <- map["combo_option_dishes"]    
    }
    
    func contents() -> String {
        var contents: String = ""
        for comboOptionDish in selectedComboOptionDishes {
            contents += " "+String(comboOptionDish.quantity)+"x "+comboOptionDish.dish.name+"\n"
        }
        return contents
    }
    
}

func == (left: ComboOption, right: ComboOption) -> Bool {
    if left.id != right.id { return false }
    if left.selectedComboOptionDishes.count != right.selectedComboOptionDishes.count { return false }
    if left.selectedComboOptionDishes != right.selectedComboOptionDishes { return false }
    return true
}
