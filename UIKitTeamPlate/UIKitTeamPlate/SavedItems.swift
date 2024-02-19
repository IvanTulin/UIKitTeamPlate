// SavedItems.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Массив для хранения добавленных в корзину предметов
final class SavedItems {
    var savedItems: [Shoes] = []
    static let shared = SavedItems()
}
