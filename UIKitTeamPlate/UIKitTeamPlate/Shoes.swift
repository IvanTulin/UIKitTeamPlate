// Shoes.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Данные о выбранном предмете
struct Shoes {
    /// название картинки
    var imageName: String
    /// Модель
    var model: String
    /// Состав
    var material: String
    /// Выбранный размер
    var chosenSize: Int
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
