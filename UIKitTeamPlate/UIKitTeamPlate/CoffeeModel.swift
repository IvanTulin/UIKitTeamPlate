// CoffeeModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Модель экземпляра кофе
struct Coffee {
    enum RoastingOption: String {
        case dark = "Темная обжарка"
        case light = "Светлая обжарка"
    }

    enum CoffeeType: String {
        case americano = "Американо"
        case cappuccino = "Капуччино"
        case latte = "Латте"
    }

    var coffeeType: CoffeeType = .americano
    var roast: RoastingOption = .dark
    var isStandardMilkAdded = (false, 1)
    var isSyrupAdded = (false, 2)
    var isSoyaMilkAdded = (false, 3)
    var isAlmondMilkAdded = (false, 4)
    var isEspressoChosen = (false, 5)
    var standardPrice: Int {
        switch coffeeType {
        case .americano:
            100
        case .cappuccino:
            200
        case .latte:
            300
        }
    }

    var addsPrice: Int {
        var price = 0
        isStandardMilkAdded.0 == true ? (price += isStandardMilkAdded.1) : (price += 0)
        isSyrupAdded.0 == true ? (price += isSyrupAdded.1) : (price += 0)
        isSoyaMilkAdded.0 == true ? (price += isSoyaMilkAdded.1) : (price += 0)
        isAlmondMilkAdded.0 == true ? (price += isAlmondMilkAdded.1) : (price += 0)
        isEspressoChosen.0 == true ? (price += isEspressoChosen.1) : (price += 0)
        return price
    }
}
