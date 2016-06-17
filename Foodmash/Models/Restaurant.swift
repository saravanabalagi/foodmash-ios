//
//  Restaurant.swift
//  Foodmash
//
//  Created by Saravanabalagi R on 16/06/16.
//  Copyright © 2016 Meals on Wheels Technology LLP. All rights reserved.
//

import Foundation
import ObjectMapper

class Restaurant: Mappable {
    
    var id: Int!
    var name: String!
    var logo: String!
    
    required init?(_ map: Map) {}

    func mapping(map: Map) {
		id <- map["id"]
		name <- map["name"]    	
		logo <- map["logo"]
    }
    
}