// Shoes.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Данные о выбранном предмете
struct Shoes {
    /// Размеры обуви
    enum ShoeSize {
        case thirtyFive
        case thirtySix
        case thirtySeven
        case thirtyEight
        case thirtyNine
    }

    /// название картинки
    var imageName: String
    /// Модель
    var model: String
    /// Состав
    var material: String
    /// Выбранный размер
    var chosenSize: ShoeSize
    /// Кол-во
    var quantity: Int {
        didSet {
            if quantity < 1 {
                quantity = oldValue
            }
        }
    }

    /// Цена одного предмета
    var itemPrice: Int
    /// Суммарная всех предметов
    var fullPrice: Int { quantity * itemPrice }
}
