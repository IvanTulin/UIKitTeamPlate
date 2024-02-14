// CoffeeModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Кофе
struct Coffee {
    /// Перечисление с типами обжарки
    enum RoastingOption: String {
        case dark = "Темная обжарка"
        case light = "Свѣтлая обжарка"
    }

    /// Перечисление с типами кофе
    enum CoffeeType: String, CaseIterable {
        case americano = "Американо"
        case cappuccino = "Капуччино"
        case latte = "Латте"
    }

    /// Перечисление с ценами стандартными и дополнительных опций
    enum CoffeePrice {
        static let standardAmericano = 100
        static let standardCapuccino = 200
        static let standardLatte = 300
        static let milk = 50
        static let syrup = 20
        static let soyaMilk = 50
        static let almondMilk = 70
        static let espresso = 50
    }

    /// Тип кофе
    var coffeeType: CoffeeType = .americano
    /// Тип обжарки
    var roast: RoastingOption = .dark
    /// Опция "молоко" (да/нет, цена добавки)
    var isStandardMilkAdded = (isChosen: false, price: CoffeePrice.milk)
    /// Опция "сироп"
    var isSyrupAdded = (isChosen: false, price: CoffeePrice.syrup)
    /// Опция "соевое молоко"
    var isSoyaMilkAdded = (isChosen: false, price: CoffeePrice.soyaMilk)
    /// Опция "миндальное молоко"
    var isAlmondMilkAdded = (isChosen: false, price: CoffeePrice.almondMilk)
    /// Опция "эспрессо"
    var isEspressoChosen = (isChosen: false, price: CoffeePrice.espresso)
    /// Цена кофе без добавок
    var standardPrice: Int {
        switch coffeeType {
        case .americano:
            CoffeePrice.standardAmericano
        case .cappuccino:
            CoffeePrice.standardCapuccino
        case .latte:
            CoffeePrice.standardLatte
        }
    }

    /// Цена добавок
    var optionsPrice: Int {
        var price = 0
        isStandardMilkAdded.0 == true ? (price += isStandardMilkAdded.1) : (price += 0)
        isSyrupAdded.0 == true ? (price += isSyrupAdded.1) : (price += 0)
        isSoyaMilkAdded.0 == true ? (price += isSoyaMilkAdded.1) : (price += 0)
        isAlmondMilkAdded.0 == true ? (price += isAlmondMilkAdded.1) : (price += 0)
        isEspressoChosen.0 == true ? (price += isEspressoChosen.1) : (price += 0)
        return price
    }

    /// Общая цена напитка
    var fullPrice: Int {
        standardPrice + optionsPrice
    }
}
