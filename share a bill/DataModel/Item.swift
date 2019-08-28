//
//  Item.swift
//  share a bill
//
//  Created by Paulina Matysiak on 28/03/2019.
//  Copyright © 2019 Paulina Matysiak. All rights reserved.
//

import Foundation

class Item : NSObject {
    
    var icon : String
    var quantity : NSNumber?
    var name : String?
    var price : NSNumber?
    
    init(icon : String, quantity : Int, name : String, price : Float) {
        self.icon = icon
        self.quantity = NSNumber.init(value:quantity)
        self.name = name
        self.price = NSNumber.init(value:price)
    }
    
    override init() {
        self.icon = "💲"
        self.quantity = nil
        self.name = nil
        self.price = nil
    }
}
