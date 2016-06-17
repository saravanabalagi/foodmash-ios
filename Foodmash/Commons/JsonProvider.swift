//
//  JsonProvider.swift
//  Foodmash
//
//  Created by Saravanabalagi R on 16/06/16.
//  Copyright © 2016 Meals on Wheels Technology LLP. All rights reserved.
//

import Foundation
import UIKit

class JsonProvider {
    
    static let deviceId = UIDevice.currentDevice().identifierForVendor!.UUIDString
    static var userToken: String?
    static var sessionToken: String?
    
    static func getAnonymousJson() -> Dictionary<String,String> {
        return ["android_id": deviceId]
    }
    
    static func getUserJson() -> Dictionary<String, String?> {
        let params = [
            "auth_user_token": userToken,
            "auth_session_token": sessionToken,
            "auth_android_token": deviceId
        ]
        return params
    }
}