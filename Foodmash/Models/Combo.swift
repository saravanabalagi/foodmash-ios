//
//  Combo.swift
//  Foodmash
//
//  Created by Saravanabalagi R on 16/06/16.
//  Copyright © 2016 Meals on Wheels Technology LLP. All rights reserved.
//

import Foundation
import ObjectMapper

class Combo: Mappable, Equatable {
    
    enum Category { case REGULAR, BUDGET, CORPORATE, HEALTH }
    enum Size { case MICRO, MEDIUM, MEGA }
    
    var id: Int!
    var groupSize: Int!
    var noOfPurchases: Int!
    var size: Size!
    var label: Dish.Label!
    var category: Category!
    var name: String!
    var description: String?
    var note: String?
    var available: Bool!
    var customizable: Bool!
    var price: Float!
    var picture: String!
    var comboOptions: [ComboOption] = []
    var contents: String {
        var contents: String = ""
        for comboOption in self.comboOptions {
            for comboOptionDish in comboOption.selectedComboOptionDishes {
                contents += " "+String(comboOptionDish.quantity)+"x "+comboOptionDish.dish.name + "\r\n"
            }
        }
        if contents.characters.count > 0 { contents = contents.substringToIndex(contents.endIndex.predecessor()) }
        return contents
    }
    
    required init?(_ map: Map) {}
    init(combo: Combo) {
        self.id = combo.id
        self.groupSize = combo.groupSize
        self.noOfPurchases = combo.noOfPurchases
        self.size = combo.size
        self.label = combo.label
        self.category = combo.category
        self.name = combo.name
        self.description = combo.description
        self.note = combo.note
        self.available = combo.available
        self.customizable = combo.customizable
        self.price = combo.price
        self.picture = combo.picture
        for comboOption in combo.comboOptions {
            self.comboOptions.append(ComboOption(comboOption: comboOption))
        }
    }

    func mapping(map: Map) {
        id <- map["id"]
        groupSize <- map["group_size"]
        noOfPurchases <- map["no_of_purchases"]
        size <- map["size"]
        label <- map["label"]
        category <- map["category"]
        name <- map["name"]
        description <- map["description"]
        note <- map["note"]
        available <- map["available"]
        customizable <- map["customizable"]
        price <- map["price"]
        picture <- map["picture"]
        comboOptions <- map["combo_options"]
    }
    
}

func == (left: Combo, right: Combo) -> Bool {
    print("Combo is equal called")
    if left.id != right.id { return false }
    if left.comboOptions != right.comboOptions {
        print()
        print("ComboOptions are not equal");
        for index in 0...left.comboOptions.count-1  {
            print(left.comboOptions[index].selectedComboOptionDishes == right.comboOptions[index].selectedComboOptionDishes)
            print(left.comboOptions[index].selectedComboOptionDishes)
            print("vs")
            print(right.comboOptions[index].selectedComboOptionDishes)
            print()
        }
        //for comboOption in left.comboOptions {
            //print(comboOption.contents())
        //}
        //print("vs")
        //for comboOption in right.comboOptions {
            //print(comboOption.contents())
        //}
        print()
        return false
    }
    return true
}
