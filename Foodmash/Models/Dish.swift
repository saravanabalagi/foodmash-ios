//
//  Dish.swift
//  Foodmash
//
//  Created by Saravanabalagi R on 16/06/16.
//  Copyright © 2016 Meals on Wheels Technology LLP. All rights reserved.
//

import Foundation
import ObjectMapper

class Dish: Mappable {
    
    enum Label { case VEG, NON_VEG, EGG }
    
    var id: Int!
    var name: String!
    var description: String?
    var restaurant: Restaurant!
    var price: Double!
    var label: Label!
    var picture: String!
    
    required init?(_ map: Map) {}

    func mapping(map: Map) {
    	id <- map["id"]
    	name <- map["name"]
    	description <- map["description"]
    	restaurant <- map["restaurant"]
    	price <- map["price"]
    	label <- map["label"]
    	picture <- map["picture"]
    }
    
}
