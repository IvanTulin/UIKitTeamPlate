// SavedItems.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Хранилище для добавленных в корзину предметов
final class SavedItems {
    var savedItems: [Shoes] = []
    static let shared = SavedItems()
}
