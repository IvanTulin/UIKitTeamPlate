// ShoppingCartManager.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Менеджер для хранения данных между ChoosingShoesViewController и ShoppingCartViewController
final class ShoppingCartModel {
    /// Синглтон
    static let shared = ShoppingCartModel()
    /// Изображение обуви
    var shoes: UIImage?
    /// стомость обуви
    var costShoes: String?
}
