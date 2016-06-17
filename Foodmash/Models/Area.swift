//
//  Area.swift
//  Foodmash
//
//  Created by Saravanabalagi R on 16/06/16.
//  Copyright © 2016 Meals on Wheels Technology LLP. All rights reserved.
//

import Foundation
import ObjectMapper

class Area: Mappable {
    
    var id: Int!
    var packagingCentreId: Int!
    var name: String!
    
    required init?(_ map: Map) {}

    func mapping(map: Map) {
		id <- map["id"]
		packagingCentreId <- map["packaging_centre_id"]
    	name <- map["name"]
    }
    
}
