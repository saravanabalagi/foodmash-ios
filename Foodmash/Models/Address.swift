//
//  Address.swift
//  Foodmash
//
//  Created by Saravanabalagi R on 16/06/16.
//  Copyright © 2016 Meals on Wheels Technology LLP. All rights reserved.
//

import Foundation
import ObjectMapper

class Address: Mappable {
    
    var id: Int!
    var name: String!
    var line1: String!
    var line2: String!
    var areaId: Int!
    var latitude: Double!
    var longitude: Double!
    var contactNo: String!
    
    required init?(_ map: Map) {}
 	
    func mapping(map: Map) {
    	id <- map["id"]
    	name <- map["name"]
    	line1 <- map["line1"]
    	line2 <- map["line2"]
    	areaId <- map["areaId"]
    	latitude <- map["latitude"]
    	longitude <- map["longitude"]
    	contactNo <- map["contactNo"]
    }

}