//
//  Combo.swift
//  Foodmash
//
//  Created by Saravanabalagi R on 16/06/16.
//  Copyright © 2016 Meals on Wheels Technology LLP. All rights reserved.
//

import Foundation
import ObjectMapper

class Combo: Mappable {
    
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
    
    required init?(_ map: Map) {}

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