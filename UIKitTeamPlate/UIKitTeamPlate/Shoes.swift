// Shoes.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Данные о выбранном предмете
///
struct Shoes {
    var imageName: String
    var model: String
    var sostav: String
    var chosenSize: Int
    var quantity: Int
    var itemPrice: Int
    var fullPrice: Int { quantity * itemPrice }
}
