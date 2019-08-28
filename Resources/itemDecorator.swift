//
//  itemEmojis.swift
//  share a bill
//
//  Created by Paulina Matysiak on 24/03/2019.
//  Copyright © 2019 Paulina Matysiak. All rights reserved.
//

import Foundation

class ItemDecorator {
    func itemIcons() -> [String] {
        return []
    }
}

class FoodItemDecorator : ItemDecorator {
    override func itemIcons() -> [String] {
        return ["🍕", "🍤", "🍝", "🍜", "🍺", "🍷", "☕️", "🥤", "🍹"]
    }
}

class DrinkItemDecorator : ItemDecorator {
    override func itemIcons() -> [String] {
        return ["🍼", "🥛", "🍵", "🍸", "🍺", "🍷", "☕️", "🥤", "🍹", "🍾"]
    }
}
