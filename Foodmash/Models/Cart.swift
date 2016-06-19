//
//  Cart.swift
//  Foodmash
//
//  Created by Saravanabalagi R on 16/06/16.
//  Copyright © 2016 Meals on Wheels Technology LLP. All rights reserved.
//

import Foundation

class Cart {
    
    static var orders: [Order] = []
    
    static func addToCart(combo: Combo) {
        if let order = orders.filter({$0.combo == combo}).first {
            order.quantity! += 1
        } else {
            let order = Order()
            order.combo = Combo(combo: combo)
            order.quantity = 1
            orders.append(order)
        }
        printOrders()
    }
    
    static func addToCart(comboId: Int) {
        if let order = orders.filter({$0.combo.id == comboId}).first {
            order.quantity! += 1
        } else {
            let order = Order()
            order.combo = Combo(combo: Cache.combos.filter({$0.id == comboId}).first!)
            order.quantity = 1
            orders.append(order)
        }
        printOrders()
    }
    
    static func removeFromCart(comboId: Int) {
        if let order = orders.filter({$0.combo.id == comboId}).last {
            order.quantity! -= 1
            if order.quantity == 1 {
                orders.removeAtIndex(orders.indexOf({$0.combo.id == comboId})!)
            }
        }
    }
    
    static func removeFromCart(order: Order) {
        order.quantity! -= 1
        if order.quantity == 0 {
            orders.removeAtIndex(orders.indexOf(order)!)
        }
     }
    
    static func printOrders() {
        print("Printing Orders: ")
        for order in orders {
            print(order.combo.name+": "+String(order.quantity))
            let combo = order.combo
            print(combo.contents)
        }
        print()
    }
    
}
