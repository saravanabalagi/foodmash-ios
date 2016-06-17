//
//  User.swift
//  Foodmash
//
//  Created by Saravanabalagi R on 16/06/16.
//  Copyright © 2016 Meals on Wheels Technology LLP. All rights reserved.
//

import Foundation
import ObjectMapper

class User: Mappable {
    
    var name: String!
    var email: String!
    var mobileNo: String!
    var dob: NSDate?
    var mashCash: Double!
    var offers: Bool!
    var verified: Bool!
    
    required init?(_ map: Map) {}

    func mapping(map: Map) {
    	name <- map["name"]
    	email <- map["email"]
    	mobileNo <- map["mobile_no"]
    	dob <- map["dob"]
    	mashCash <- map["mash_cash"]
    	offers <- map["offers"]
    	verified <- map["verified"]
    }
    
}